defmodule PrometheusMetricsWithPromex.Repo do
  use Ecto.Repo,
    otp_app: :prometheus_metrics_with_promex,
    adapter: Ecto.Adapters.Postgres
end
