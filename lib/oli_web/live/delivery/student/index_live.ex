defmodule OliWeb.Delivery.Student.IndexLive do
  use OliWeb, :live_view

  import OliWeb.Components.Delivery.Layouts

  alias Oli.Delivery.{Attempts, Hierarchy, Metrics, Sections}
  alias Oli.Delivery.Sections.SectionCache
  alias Oli.Publishing.DeliveryResolver
  alias OliWeb.Common.FormatDateTime
  alias OliWeb.Components.Delivery.Student
  alias OliWeb.Delivery.Student.Utils
  alias OliWeb.Delivery.Student.Home.Components.ScheduleComponent
  alias OliWeb.Icons

  def mount(_params, _session, socket) do
    section = socket.assigns[:section]
    current_user_id = socket.assigns[:current_user].id

    schedule_for_current_week_and_next_week =
      Sections.get_schedule_for_current_and_next_week(section, current_user_id)

    # Use the root container revision to store the intro message for the course
    intro_message =
      section.slug
      |> DeliveryResolver.root_container()
      |> build_intro_message_title()

    latest_lessons = Sections.get_last_completed_or_started_pages(section, current_user_id, 3)
    upcoming_lessons = Sections.get_nearest_upcoming_lessons(section, current_user_id, 3)

    [last_open_and_unfinished_page, nearest_upcoming_lesson] =
      Enum.map(
        [
          Sections.get_last_open_and_unfinished_page(section, current_user_id),
          List.first(upcoming_lessons)
        ],
        fn
          nil ->
            nil

          page ->
            page_module_index =
              section
              |> get_or_compute_full_hierarchy()
              |> Hierarchy.find_module_ancestor(
                page[:resource_id],
                Oli.Resources.ResourceType.get_id_by_type("container")
              )
              |> get_in(["numbering", "index"])

            Map.put(page, :module_index, page_module_index)
        end
      )

    {:ok,
     assign(socket,
       active_tab: :index,
       schedule_for_current_week_and_next_week: schedule_for_current_week_and_next_week,
       section_slug: section.slug,
       section_start_date: section.start_date,
       historical_graded_attempt_summary: nil,
       has_visited_section:
         Sections.has_visited_section(section, socket.assigns[:current_user],
           enrollment_state: false
         ),
       last_open_and_unfinished_page: last_open_and_unfinished_page,
       nearest_upcoming_lesson: nearest_upcoming_lesson,
       upcoming_lessons: upcoming_lessons,
       latest_lessons: latest_lessons,
       section_progress: section_progress(section.id, current_user_id),
       intro_message: intro_message,
       assignments_tab: :upcoming
     )}
  end

  def handle_params(_params, _uri, socket) do
    {:noreply, socket}
  end

  def render(assigns) do
    ~H"""
    <.header_banner
      ctx={@ctx}
      section_slug={@section_slug}
      has_visited_section={@has_visited_section}
      suggested_page={@last_open_and_unfinished_page || @nearest_upcoming_lesson}
      unfinished_lesson={!is_nil(@last_open_and_unfinished_page)}
      intro_message={@intro_message}
    />
    <div
      id="schedule-view"
      class="w-full h-full relative bg-stone-950 dark:text-white"
      phx-hook="Countdown"
    >
      <div class="w-full absolute p-8 justify-start items-start gap-6 inline-flex">
        <div class="w-1/4 h-48 flex-col justify-start items-start gap-6 inline-flex">
          <.course_progress has_visited_section={@has_visited_section} progress={@section_progress} />
          <.assignments
            upcoming_lessons={@upcoming_lessons}
            latest_lessons={@latest_lessons}
            section_slug={@section_slug}
            assignments_tab={@assignments_tab}
          />
        </div>

        <div class="w-3/4 h-full flex-col justify-start items-start gap-6 inline-flex">
          <.agenda
            section_slug={@section_slug}
            schedule_for_current_week_and_next_week={@schedule_for_current_week_and_next_week}
            section_start_date={@section_start_date}
            ctx={@ctx}
          />
        </div>
      </div>
    </div>
    """
  end

  attr(:ctx, :map, default: nil)
  attr(:section_slug, :string, required: true)
  attr(:has_visited_section, :boolean, required: true)
  attr(:suggested_page, :map)
  attr(:unfinished_lesson, :boolean, required: true)
  attr(:intro_message, :map)

  defp header_banner(%{has_visited_section: true} = assigns) do
    ~H"""
    <div class="w-full h-72 relative flex items-center">
      <div class="inset-0 absolute">
        <div class="inset-0 absolute bg-purple-700 bg-opacity-50"></div>
        <img
          src="/images/gradients/home-bg.png"
          alt="Background Image"
          class="absolute inset-0 w-full h-full object-cover border border-gray-300 dark:border-black mix-blend-luminosity"
        />
        <div class="absolute inset-0 opacity-60">
          <div class="absolute left-[1250px] top-0 origin-top-left rotate-180 bg-gradient-to-r from-white to-white">
          </div>
          <div class="absolute inset-0 bg-gradient-to-r from-blue-700 to-cyan-500"></div>
        </div>
      </div>

      <div
        :if={!is_nil(@suggested_page)}
        class="w-full px-9 absolute flex-col justify-center items-start gap-6 inline-flex"
      >
        <div class="text-white text-2xl font-bold leading-loose tracking-tight">
          Continue Learning
        </div>
        <div class="self-stretch p-6 bg-zinc-900 bg-opacity-40 rounded-xl justify-between items-end inline-flex">
          <div class="flex-col justify-center items-start gap-3.5 inline-flex">
            <div class="self-stretch h-3 justify-start items-center gap-3.5 inline-flex">
              <div
                :if={show_page_module?(@suggested_page)}
                class="justify-start items-start gap-1 flex"
              >
                <div class="opacity-50 text-white text-sm font-bold uppercase tracking-tight">
                  Module <%= @suggested_page.module_index %>
                </div>
              </div>
              <div class="grow shrink basis-0 h-5 justify-start items-center gap-1 flex">
                <div class="text-right text-white text-sm font-bold">Due:</div>
                <div class="text-right text-white text-sm font-bold">
                  <%= format_date(
                    @suggested_page.end_date,
                    @ctx,
                    "{WDshort} {Mshort} {D}, {YYYY}"
                  ) %>
                </div>
              </div>
            </div>
            <div class="justify-start items-center gap-10 inline-flex">
              <div class="justify-start items-center gap-5 flex">
                <div class="py-0.5 justify-start items-start gap-2.5 flex">
                  <div class="text-white text-xs font-semibold">
                    <%= @suggested_page.numbering_index %>
                  </div>
                </div>
                <div class="flex-col justify-center items-start gap-1 inline-flex">
                  <div class="text-white text-lg font-semibold">
                    <%= @suggested_page.title %>
                  </div>
                </div>
              </div>
              <div
                :if={@suggested_page.duration_minutes}
                class="w-36 self-stretch justify-end items-center gap-1.5 flex"
              >
                <div class="h-6 px-2 py-1 bg-white bg-opacity-10 rounded-xl shadow justify-end items-center gap-1 flex">
                  <div class="text-white text-xs font-semibold">
                    Estimated time <%= @suggested_page.duration_minutes %> m
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="justify-start items-start gap-3.5 flex">
            <.link
              href={
                Utils.lesson_live_path(
                  @section_slug,
                  @suggested_page.slug,
                  request_path: ~p"/sections/#{@section_slug}"
                )
              }
              class="hover:no-underline"
            >
              <div class="w-full h-10 px-5 py-2.5 bg-blue-600 rounded-lg shadow justify-center items-center gap-2.5 flex hover:bg-blue-500">
                <div class="text-white text-sm font-bold leading-tight">
                  <%= lesson_button_label(@unfinished_lesson, @suggested_page) %>
                </div>
              </div>
            </.link>
            <.link
              href={
                Utils.learn_live_path(@section_slug,
                  target_resource_id: @suggested_page.resource_id,
                  request_path: ~p"/sections/#{@section_slug}"
                )
              }
              class="hover:no-underline"
            >
              <div class="w-44 h-10 px-5 py-2.5 bg-white bg-opacity-20 rounded-lg shadow justify-center items-center gap-2.5 flex hover:bg-opacity-40">
                <div class="text-white text-sm font-semibold leading-tight">
                  Show in course
                </div>
              </div>
            </.link>
          </div>
        </div>
      </div>
    </div>
    """
  end

  defp header_banner(assigns) do
    ~H"""
    <div class="w-full h-96 relative flex items-center">
      <div class="inset-0 absolute">
        <div class="inset-0 absolute bg-purple-700 bg-opacity-50"></div>
        <img
          src="/images/gradients/home-bg.png"
          alt="Background Image"
          class="absolute inset-0 w-full h-full object-cover border border-gray-300 dark:border-black mix-blend-luminosity"
        />
        <div class="absolute inset-0 opacity-60">
          <div class="absolute left-[1250px] top-0 origin-top-left rotate-180 bg-gradient-to-r from-white to-white">
          </div>
          <div class="absolute inset-0 bg-gradient-to-r from-blue-700 to-cyan-500"></div>
        </div>
      </div>

      <div class="w-full pl-14 pr-5 absolute flex flex-col justify-center items-start gap-6">
        <div class="w-full text-white text-2xl font-bold tracking-wide whitespace-nowrap overflow-hidden">
          Hi, <%= user_given_name(@ctx) %> !
        </div>
        <div class="w-full flex flex-col items-start gap-2.5">
          <div class="w-full whitespace-nowrap overflow-hidden">
            <span class="text-3xl text-white font-medium">
              <%= @intro_message %>
            </span>
          </div>
          <div class="w-full text-white/60 text-lg font-semibold">
            Dive Into Discovery. Begin Your Learning Adventure Now!
          </div>
        </div>
        <div class="pt-5 flex items-start gap-6">
          <.link
            href={
              Utils.lesson_live_path(
                @section_slug,
                DeliveryResolver.get_first_page_slug(@section_slug),
                request_path: ~p"/sections/#{@section_slug}"
              )
            }
            class="hover:no-underline"
          >
            <div class="w-52 h-11 px-5 py-2.5 bg-blue-600 rounded-lg shadow flex justify-center items-center gap-2.5 hover:bg-blue-500">
              <div class="text-white text-base font-bold leading-tight">
                Start course
              </div>
            </div>
          </.link>
          <.link href={Utils.learn_live_path(@section_slug)} class="hover:no-underline">
            <div class="w-52 h-11 px-5 py-2.5 bg-white bg-opacity-20 rounded-lg shadow flex justify-center items-center gap-2.5 hover:bg-opacity-40">
              <div class="text-white text-base font-semibold leading-tight">
                Discover content
              </div>
            </div>
          </.link>
        </div>
      </div>
    </div>
    """
  end

  attr(:has_visited_section, :boolean, required: true)
  attr(:progress, :integer, required: true)

  defp course_progress(assigns) do
    ~H"""
    <div class="w-full h-fit p-6 bg-[#1C1A20] bg-opacity-20 dark:bg-opacity-100 rounded-2xl justify-start items-start gap-32 inline-flex">
      <div class="flex-col justify-start items-start gap-5 inline-flex grow">
        <div class="justify-start items-start gap-2.5 inline-flex">
          <div class="text-2xl font-bold leading-loose tracking-tight">
            Course Progress
          </div>
        </div>
        <%= if @has_visited_section do %>
          <div class="flex-col justify-start items-start flex">
            <div>
              <span class="text-6xl font-bold tracking-wide"><%= @progress %></span>
              <span class="text-3xl font-bold tracking-tight">%</span>
            </div>
          </div>
        <% else %>
          <div class="justify-start items-center gap-1 inline-flex self-stretch">
            <div class="text-base font-normal tracking-tight grow">
              Begin your learning journey to watch your progress unfold here!
            </div>
          </div>
        <% end %>
      </div>
    </div>
    """
  end

  attr(:upcoming_lessons, :list, required: true)
  attr(:latest_lessons, :list, default: [])
  attr(:section_slug, :string, required: true)
  attr(:assignments_tab, :atom, required: true)

  defp assignments(assigns) do
    lessons =
      case assigns.assignments_tab do
        :upcoming -> assigns.upcoming_lessons
        :latest -> assigns.latest_lessons
      end

    assigns = Map.put(assigns, :lessons, lessons)

    ~H"""
    <div class="w-full h-fit p-6 bg-[#1C1A20] bg-opacity-20 dark:bg-opacity-100 rounded-2xl justify-start items-start gap-32 inline-flex">
      <div class="flex-col justify-start items-start gap-5 flex grow">
        <div class="justify-start items-start gap-2.5 flex">
          <div class="text-2xl font-bold leading-loose tracking-tight">
            My Assignments
          </div>
        </div>
        <div class="w-full dark:text-white h-6 justify-start items-start gap-3.5 flex">
          <button
            phx-click="toggle_assignments_tab"
            class={assignments_tab_class(@assignments_tab, :upcoming)}
          >
            <div class="w-24 text-lg tracking-tight font-bold whitespace-nowrap">
              Upcoming
            </div>
          </button>
          <button
            phx-click="toggle_assignments_tab"
            class={assignments_tab_class(@assignments_tab, :latest)}
          >
            <div class="grow shrink basis-0 text-lg tracking-tight font-bold">Latest</div>
          </button>
        </div>
        <div class="w-full flex-col justify-start items-start gap-2.5 flex">
          <%= if Enum.empty?(@lessons) do %>
            <div class="w-80 h-16 flex-col justify-start items-start gap-2.5 flex">
              <div class="w-80 text-white text-base font-normal font-sans tracking-[0.32px] break-words">
                <%= empty_assignments_message(@assignments_tab) %>
              </div>
            </div>
          <% else %>
            <.lesson_card
              :for={lesson <- @lessons}
              upcoming={@assignments_tab == :upcoming}
              lesson={lesson}
              section_slug={@section_slug}
            />
          <% end %>
        </div>
      </div>
    </div>
    """
  end

  defp assignments_tab_class(tab, tab), do: "pointer-events-none cursor-not-allowed"
  defp assignments_tab_class(_, _), do: "opacity-40 hover:opacity-70"

  defp empty_assignments_message(:upcoming),
    do: "Great job, you completed all the assignments! There are no upcoming assignments."

  defp empty_assignments_message(:latest),
    do: "It looks like you need to start your attempt. Begin with the upcoming assignments!"

  attr(:lesson, :map, required: true)
  attr(:upcoming, :boolean, required: true)
  attr(:section_slug, :string, required: true)

  defp lesson_card(assigns) do
    assigns =
      Map.merge(assigns, %{
        lesson_type: Student.type_from_resource(assigns.lesson),
        completed: !assigns.upcoming and completed_lesson?(assigns.lesson)
      })

    ~H"""
    <.link
      href={
        Utils.lesson_live_path(@section_slug, @lesson.slug,
          request_path: ~p"/sections/#{@section_slug}"
        )
      }
      class="w-full text-black hover:text-black hover:no-underline"
    >
      <div class={[
        left_bar_color(@lesson_type),
        item_bg_color(@completed),
        "flex h-full px-2.5 py-3.5 rounded-xl border flex-col justify-start items-start hover:cursor-pointer relative overflow-hidden z-0 before:content-[''] before:absolute before:left-0 before:top-0 before:w-0.5 before:h-full before:z-10"
      ]}>
        <div class="self-stretch justify-between items-start flex pl-2">
          <div class="grow shrink basis-0 self-stretch flex-col justify-start items-start gap-2.5 flex">
            <div role="container_label" class="justify-start items-start gap-2 flex uppercase">
              <div class="dark:text-white text-opacity-60 text-xs font-bold whitespace-nowrap">
                Unit 4
              </div>

              <div class="flex items-center gap-2">
                <div class="dark:text-white text-opacity-60 text-xs font-bold">•</div>
                <div class="dark:text-white text-opacity-60 text-xs font-bold whitespace-nowrap">
                  Module 11
                </div>
              </div>
            </div>
            <div role="title" class="self-stretch pb-2.5 justify-start items-start gap-2.5 flex">
              <div class="grow shrink basis-0 dark:text-white text-opacity-90 text-lg font-semibold">
                <%= @lesson.title %>
              </div>
            </div>
          </div>
          <Student.resource_type type={@lesson_type} long={false} />
        </div>

        <.lesson_details upcoming={@upcoming} lesson={@lesson} completed={@completed} />
      </div>
    </.link>
    """
  end

  defp left_bar_color(:assignment), do: "before:bg-[#FF8F40]"
  defp left_bar_color(:practice), do: "before:bg-[#8CBCFF]"
  defp left_bar_color(:exploration), do: "before:bg-[#EC8CFF]"
  defp left_bar_color(_), do: ""

  defp item_bg_color(true = _completed),
    do:
      "bg-black/[.07] hover:bg-black/[.1] border border-white/[.1] dark:bg-white/[.02] dark:hover:bg-white/[.06] dark:border-white/[0.06] dark:hover:border-white/[0.02]"

  defp item_bg_color(false = _completed),
    do:
      "bg-black/[.1] hover:bg-black/[.2] border border-white/[.6] hover:border-transparent dark:bg-white/[.08] dark:hover:bg-white/[.12] dark:border-black hover:border-none"

  attr :lesson, :map, required: true
  attr :upcoming, :boolean, required: true
  attr :completed, :boolean, required: true

  defp lesson_details(%{upcoming: true} = assigns) do
    ~H"""
    <div role="details" class="w-full h-full flex flex-col items-stretch gap-5 relative">
      <div class="pr-2 pl-1 self-end">
        <div class="flex items-end gap-1">
          <div class="text-right dark:text-white text-opacity-90 text-xs font-semibold">
            <%= Utils.days_difference(@lesson.end_date) %>
          </div>
        </div>
      </div>
    </div>
    """
  end

  # Completed page (graded or practice)
  defp lesson_details(%{completed: true} = assigns) do
    ~H"""
    <div role="details" class="pt-2 pb-1 px-1 flex self-stretch justify-between gap-5">
      <div class="justify-end items-end gap-2.5 flex ml-auto">
        <div class="flex items-end gap-1">
          <div class="text-right dark:text-white text-opacity-90 text-xs font-semibold">
            Completed
          </div>
          <Icons.check progress={1.0} />
        </div>
      </div>
    </div>
    """
  end

  # Non-completed graded page (assignment)
  defp lesson_details(%{lesson: %{graded: true}} = assigns) do
    ~H"""
    <div role="details" class="pt-2 pb-1 px-1 flex self-stretch justify-between gap-5">
      <%= if @lesson.last_attempt_state != :active do %>
        <div class="flex px-2 py-0.5 bg-white/10 rounded-xl shadow tracking-tight gap-2 items-center align-center">
          <div role="count" class="pl-1 justify-start items-center gap-2.5 flex">
            <div class="dark:text-white text-xs font-semibold">
              Attempt <%= "#{@lesson.attempts_count}/#{max_attempts(@lesson.max_attempts)}" %>
            </div>
          </div>
        </div>
      <% else %>
        <div
          :if={@lesson.end_date}
          class="w-fit h-4 pl-1 justify-center items-start gap-1 inline-flex"
        >
          <div class="opacity-50 text-white text-xs font-normal">
            Time Remaining:
          </div>
          <div
            role="countdown"
            class={[
              if(@lesson.purpose == :application, do: "text-[#EC8CFF]", else: "text-[#FF8F40]"),
              "text-xs font-normal"
            ]}
          >
            <%= Student.format_time_remaining(@lesson.end_date) %>
          </div>
        </div>
      <% end %>
      <div class="justify-end items-end gap-2.5 flex ml-auto">
        <div class="text-green-700 dark:text-green-500 flex justify-end items-center gap-1">
          <div class="w-4 h-4 relative"><Icons.star /></div>
          <div class="text-sm font-semibold tracking-tight">
            <%= Utils.parse_score(@lesson.score) %>
          </div>
          <div class="text-sm font-semibold tracking-widest">
            /
          </div>
          <div class="text-sm font-semibold tracking-tight">
            <%= Utils.parse_score(@lesson.out_of) %>
          </div>
        </div>
      </div>
    </div>
    """
  end

  # Non-completed practice page
  defp lesson_details(assigns) do
    ~H"""
    <div role="details" class="pt-2 pb-1 px-1 flex self-stretch justify-between gap-5">
      <div :if={@lesson.end_date} class="w-fit h-4 pl-1 justify-center items-start gap-1 inline-flex">
        <div class="opacity-50 text-white text-xs font-normal">
          Time Remaining:
        </div>
        <div role="countdown" class="text-[#8CBCFF] text-xs font-normal">
          <%= Student.format_time_remaining(@lesson.end_date) %>
        </div>
      </div>
    </div>
    """
  end

  defp completed_lesson?(%{graded: true} = assignment),
    do:
      assignment.attempts_count == assignment.max_attempts and
        assignment.last_attempt_state != :active

  defp completed_lesson?(practice), do: practice.progress == 1.0

  attr(:section_slug, :string, required: true)
  attr(:section_start_date, :string, required: true)
  attr(:schedule_for_current_week_and_next_week, :map, required: true)
  attr(:ctx, :map, required: true)

  defp agenda(assigns) do
    ~H"""
    <div class="w-full h-fit overflow-y-auto p-6 bg-[#1C1A20] bg-opacity-20 dark:bg-opacity-100 rounded-2xl justify-start items-start gap-32 inline-flex">
      <div class="flex-col justify-start items-start gap-7 inline-flex grow">
        <div class="self-stretch justify-between items-baseline inline-flex gap-2.5">
          <div class="text-2xl font-bold leading-loose tracking-tight">
            Upcoming Agenda
          </div>
          <.link
            href={
              Utils.schedule_live_path(
                @section_slug,
                request_path: ~p"/sections/#{@section_slug}"
              )
            }
            class="hover:no-underline"
          >
            <div class="text-[#3399FF] hover:text-opacity-80 text-base font-bold tracking-tight">
              View full schedule
            </div>
          </.link>
        </div>
        <.live_component
          module={ScheduleComponent}
          ctx={@ctx}
          id="schedule_component"
          schedule_for_current_week_and_next_week={@schedule_for_current_week_and_next_week}
          section_start_date={@section_start_date}
          section_slug={@section_slug}
        />
      </div>
    </div>
    """
  end

  def handle_event(
        "load_historical_graded_attempt_summary",
        %{"page_revision_slug" => page_revision_slug},
        socket
      ) do
    %{section: section, current_user: current_user} = socket.assigns

    historical_graded_attempt_summary =
      Attempts.get_historical_graded_attempt_summary(section, page_revision_slug, current_user.id)

    {:noreply,
     assign(socket, historical_graded_attempt_summary: historical_graded_attempt_summary)}
  end

  def handle_event("clear_historical_graded_attempt_summary", _params, socket) do
    {:noreply, assign(socket, historical_graded_attempt_summary: nil)}
  end

  def handle_event("toggle_assignments_tab", _params, socket) do
    case socket.assigns.assignments_tab do
      :upcoming -> {:noreply, assign(socket, assignments_tab: :latest)}
      :latest -> {:noreply, assign(socket, assignments_tab: :upcoming)}
    end
  end

  defp format_date("Not yet scheduled", _context, _format), do: "Not yet scheduled"

  defp format_date(due_date, context, format) do
    FormatDateTime.to_formatted_datetime(due_date, context, format)
  end

  def get_or_compute_full_hierarchy(section) do
    SectionCache.get_or_compute(section.slug, :full_hierarchy, fn ->
      Hierarchy.full_hierarchy(section)
    end)
  end

  # Do not show the module index if it does not exist or the page is not graded or is an exploration
  defp show_page_module?(page) do
    !(is_nil(page.module_index) or !page.graded or page.purpose == :application)
  end

  defp lesson_button_label(unfinished_lesson?, page) do
    if(unfinished_lesson?,
      do: "Resume",
      else: "Start"
    ) <>
      cond do
        !page.graded -> " practice"
        page.purpose == :application -> " exploration"
        true -> " lesson"
      end
  end

  defp section_progress(section_id, user_id) do
    Metrics.progress_for(section_id, user_id)
    |> Kernel.*(100)
    |> round()
    |> trunc()
  end

  defp build_intro_message_title(%{intro_content: intro_content})
       when intro_content not in [nil, %{}],
       do:
         Phoenix.HTML.raw(
           Oli.Rendering.Content.render(
             %Oli.Rendering.Context{},
             intro_content["children"],
             Oli.Rendering.Content.Html
           )
         )

  defp build_intro_message_title(_), do: "Welcome to the Course"

  defp max_attempts(0), do: "∞"
  defp max_attempts(max_attempts), do: max_attempts
end
