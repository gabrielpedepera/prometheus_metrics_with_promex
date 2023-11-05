# Prometheus Metrics with PromEx

This application was created as a practice project to learn the process of building custom Prometheus metrics with PromEx. It was primarily based on the following articles:

- [Building Your Own Prometheus Metrics with PromEx](https://dockyard.com/blog/2023/09/12/building-your-own-prometheus-metrics-with-promex)
- [How to Monitor PostgreSQL with Prometheus and Grafana (Docker)](https://dev.to/nelsoncode/how-to-monitor-posgresql-with-prometheus-and-grafana-docker-24c8)

## Overview

This application demonstrates how to use PromEx to create custom Prometheus metrics. It also includes a Docker Compose setup for running the application along with Grafana and PostgreSQL, and for monitoring PostgreSQL with Prometheus and Grafana.

## Getting Started

To get started with this application, you'll need to have Docker and Docker Compose installed on your machine.

1. Clone the repository:

```bash
git clone https://github.com/gabrielpedepera/prometheus_metrics_with_promex.git
```

2. Navigate to the project directory:

```bash
cd prometheus_metrics_with_promex
```

3. Create a `.env` file in the root directory of the project and add your environment variables:

```env
SECRET_KEY_BASE=your_secret_key_base
DATABASE_URL=ecto://postgres:postgres@postgres:5432/prometheus_metrics_with_promex
GRAFANA_URL=http://grafana:3000
```

The `SECRET_KEY_BASE` can be generated through the command `mix phx.gen.secret`.

4. Build and start the Docker containers:

```bash
docker-compose up --build
```

The application will be available at `http://localhost:4000`, Grafana at `http://localhost:3000`, and Prometheus at `http://localhost:9090`.

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## License

This project is licensed under the MIT License.
