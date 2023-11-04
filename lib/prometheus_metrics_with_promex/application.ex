defmodule PrometheusMetricsWithPromex.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      PrometheusMetricsWithPromexWeb.Telemetry,
      PrometheusMetricsWithPromex.Repo,
      {DNSCluster, query: Application.get_env(:prometheus_metrics_with_promex, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: PrometheusMetricsWithPromex.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: PrometheusMetricsWithPromex.Finch},
      # Start a worker by calling: PrometheusMetricsWithPromex.Worker.start_link(arg)
      # {PrometheusMetricsWithPromex.Worker, arg},
      # Start to serve requests, typically the last entry
      PrometheusMetricsWithPromexWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: PrometheusMetricsWithPromex.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    PrometheusMetricsWithPromexWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
