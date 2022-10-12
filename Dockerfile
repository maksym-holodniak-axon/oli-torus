ARG ELIXIR_VERSION
ARG NODE_VERSION
ARG RELEASE_SHA

### STAGE 1: Build a Mix.Release of the application
FROM elixir:${ELIXIR_VERSION}-alpine AS phx-builder

WORKDIR /app

ENV MIX_ENV=prod
ENV SHA=RELEASE_SHA

RUN mix local.hex --force
RUN mix local.rebar --force
RUN apk update && apk add --no-cache build-base yarn

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

### STAGE 2: Use node alpine image to source prebuilt binaries
FROM node:${NODE_VERSION}-alpine AS node

### STAGE 3: Create a smaller deployment image
FROM elixir:${ELIXIR_VERSION}-alpine

# Copy over prebuilt NodeJS binaries
COPY --from=node /usr/lib /usr/lib
COPY --from=node /usr/local/share /usr/local/share
COPY --from=node /usr/local/lib /usr/local/lib
COPY --from=node /usr/local/include /usr/local/include
COPY --from=node /usr/local/bin /usr/local/bin

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

RUN apk update && apk add --no-cache curl

RUN \
  addgroup \
  -g 1000 \
  -S "${USER}" && \
  adduser \
  -s /bin/sh \
  -u 1000 \
  -G "${USER}" \
  -h "${HOME}" \
  -D "${USER}" && \
  chown "${USER}:${USER}" ${APP_DIR}

# Copy the files necessary to run the application
COPY --from=phx-builder --chown="${USER}":"${USER}" /app/_build/prod/rel/oli ./
COPY --from=phx-builder --chown="${USER}":"${USER}" /app/entrypoint.sh ./

RUN chmod +x entrypoint.sh

# Define the entrypoint and the command it should execute
ENTRYPOINT ["sh", "/oli/entrypoint.sh"]
CMD ["bin/oli", "start"]