defmodule OliWeb.Components.Delivery.Layouts do
  @moduledoc """
  This module contains the layout components for the delivery UI.
  """
  use OliWeb, :html

  embed_templates "layouts/*"

  import OliWeb.Components.Delivery.Utils

  alias OliWeb.Common.SessionContext
  alias OliWeb.Common.React
  alias Oli.Delivery.Sections.Section
  alias Oli.Branding
  alias Oli.Branding.Brand
  alias OliWeb.Components.Delivery.UserAccountMenu

  attr(:ctx, SessionContext)
  attr(:section, Section)
  attr(:brand, Brand)
  attr(:is_preview_mode, :boolean)
  attr(:active_tab, :atom, required: true)
  slot(:inner_block, required: true)

  def header_with_sidebar_nav(assigns) do
    ~H"""
    <div class="h-screen flex flex-col overscroll-none">
      <.header ctx={@ctx} section={@section} brand={@brand} is_preview_mode={@is_preview_mode} />

      <main role="main" class="flex-1 flex flex-col relative lg:flex-row overscroll-contain">
        <.sidebar_nav ctx={@ctx} section={@section} active_tab={@active_tab} />

        <div class="flex-1 flex flex-col">
          <%= render_slot(@inner_block) %>
        </div>
      </main>
    </div>
    """
  end

  attr(:ctx, SessionContext)
  attr(:section, Section)
  attr(:brand, Brand)
  attr(:is_preview_mode, :boolean)

  def header(assigns) do
    ~H"""
    <div class="h-14 flex flex-row bg-delivery-header dark:bg-delivery-header-dark">
      <div class="w-48 p-3">
        <a
          className="block lg:p-2 lg:mb-14 mx-auto"
          href={logo_link_path(@is_preview_mode, @section, @ctx.user)}
        >
          <.logo_img />
        </a>
      </div>
      <div class="flex-grow-1 p-3">
        <div class="text-2xl text-bold"><%= @section.title %></div>
      </div>
      <div class="p-3">
        <UserAccountMenu.menu ctx={@ctx} section={@section} />
      </div>
    </div>
    """
  end

  attr(:ctx, SessionContext)
  attr(:section, Section)
  attr(:active_tab, :atom)

  def sidebar_nav(assigns) do
    ~H"""
    <div class="flex flex-col w-48 shadow-xl bg-delivery-navbar dark:bg-delivery-navbar-dark">
      <.nav_link href={~p"/sections/#{@section.slug}"} is_active={@active_tab == :index}>
        Home
      </.nav_link>
      <.nav_link href={~p"/sections/#{@section.slug}/content"} is_active={@active_tab == :content}>
        Content
      </.nav_link>
      <.nav_link href="#TODO" is_active={false}>Discussion</.nav_link>
      <.nav_link href="#TODO" is_active={false}>Assignments</.nav_link>
      <.nav_link href="#TODO" is_active={false}>Explorations</.nav_link>
      <div class="flex-grow-1"></div>
      <.tech_support_button ctx={@ctx} />
    </div>
    """
  end

  attr :href, :string, required: true
  attr :is_active, :boolean, required: true
  slot :inner_block, required: true

  def nav_link(assigns) do
    ~H"""
    <.link navigate={@href} class={nav_link_class(@is_active)}>
      <%= render_slot(@inner_block) %>
    </.link>
    """
  end

  defp nav_link_class(is_active) do
    case is_active do
      true ->
        "px-6 py-4 font-bold hover:text-delivery-primary"

      false ->
        "px-6 py-4 hover:text-delivery-primary"
    end
  end

  attr(:section, Section)
  attr(:brand, Brand)

  def logo_img(assigns) do
    assigns =
      assigns
      |> assign(:logo_src, Branding.brand_logo_url(assigns[:section]))
      |> assign(:logo_src_dark, Branding.brand_logo_url_dark(assigns[:section]))

    ~H"""
    <img src={@logo_src} class="inline-block dark:hidden" alt="logo" />
    <img src={@logo_src_dark} class="hidden dark:inline-block" alt="logo dark" />
    """
  end

  attr(:ctx, SessionContext)

  def tech_support_button(assigns) do
    ~H"""
    <div class="px-6 py-4 text-center">
      <%= React.component(
        @ctx,
        "Components.TechSupportButton",
        %{},
        id: "tech-support-button"
      ) %>
    </div>
    """
  end
end
