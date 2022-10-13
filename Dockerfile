ARG ELIXIR_VERSION
ARG RELEASE_SHA

### STAGE 1: Build a Mix.Release of the application
FROM elixir:${ELIXIR_VERSION} AS phx-builder

WORKDIR /app

ENV MIX_ENV=prod
ENV SHA=RELEASE_SHA

# install nodejs
RUN apt update -y && apt install -y curl build-essential
RUN curl -sL https://deb.nodesource.com/setup_16.x | bash -
RUN apt update -y && apt install -y nodejs
RUN npm install -g yarn

RUN mix local.hex --force
RUN mix local.rebar --force

# Elixir deps
ADD mix.exs mix.lock ./
RUN mix do deps.get --only prod, deps.compile

# NPM deps
ADD assets/package.json assets/yarn.lock assets/
RUN yarn --cwd assets install

# Copy all local files to the build context
# Ignores the ones specified in .dockerignore
ADD . .

# Run frontend build, compile, and digest assets
RUN yarn --cwd assets run deploy
RUN mix do compile, phx.digest

# Create a Mix.Release of the application
RUN mix release

### STAGE 2: Create a smaller deployment image
FROM elixir:${ELIXIR_VERSION}

ENV MIX_ENV=prod

# Create a unprivileged user to run the app
#
# This is a common security practice to avoid
# giving root permissions to the application which attackers
# could potentially abuse if they gain access to the application.
ENV USER="phoenix"
ENV HOME=/home/"${USER}"
ENV APP_DIR="/oli"
WORKDIR ${APP_DIR}

# install nodejs
RUN apt update -y && apt install -y curl
RUN curl -sL https://deb.nodesource.com/setup_16.x | bash -
RUN apt update -y && apt install -y nodejs

# Copy the files necessary to run the application
COPY --from=phx-builder --chown="${USER}":"${USER}" /app/_build/prod/rel/oli ./
COPY --from=phx-builder --chown="${USER}":"${USER}" /app/entrypoint.sh ./

RUN chmod +x entrypoint.sh

# Define the entrypoint and the command it should execute
ENTRYPOINT ["sh", "/oli/entrypoint.sh"]
CMD ["bin/oli", "start"]