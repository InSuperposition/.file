# Implementation Stack Reference

This document provides a comprehensive reference of software tools and technologies commonly used in projects, along with their official documentation URLs for Claude to reference.

## Container & Orchestration

### Container Engines

- **Podman**: Container engine alternative to Docker
  - Docs: https://docs.podman.io/
  - Containerfile: Use `Containerfile` not `Dockerfile`
- **Docker**: Container platform
  - Docs: https://docs.docker.com/
- **Buildah**: Container image building
  - Docs: https://buildah.io/

### Orchestration

- **Kubernetes**: Container orchestration
  - Docs: https://kubernetes.io/docs/
- **Podman Compose**: Podman's compose implementation
  - Docs: https://github.com/containers/podman-compose
- **Docker Compose**: Multi-container applications
  - Docs: https://docs.docker.com/compose/

## Development Environments

### Dev Containers

- **Dev Containers Spec**: An open specification for enriching containers with development specific content and settings.
  - Docs: https://containers.dev/
- **VS Code Dev Containers**: Consistent development environments
  - Docs: https://code.visualstudio.com/docs/devcontainers/containers
- **GitHub Codespaces**: Cloud-based dev environments
  - Docs: https://docs.github.com/en/codespaces

## Service Mesh & Networking

### Service Mesh

- **Linkerd**: Lightweight service mesh
  - Docs: https://linkerd.io/2/overview/

### DNS & Load Balancing

- **CoreDNS**: DNS server
  - Docs: https://coredns.io/manual/
- **NGINX**: Web server and reverse proxy
  - Docs: https://nginx.org/en/docs/
- **Traefik**: Reverse proxy and load balancer
  - Docs: https://doc.traefik.io/traefik/

## Authentication & Authorization

### Identity Providers

- **Keycloak**: Open source identity management
  - Docs: https://www.keycloak.org/documentation

### Authentication Protocols

- **FIDO2/WebAuthn.**: Authorization framework
  - Docs: https://passkeys.dev/docs/reference/specs/

## Security

### Secret Management

- **Kubernetes Secrets**: Built-in secret management
  - Docs: https://kubernetes.io/docs/concepts/configuration/secret/

### Security Scanning

- **Trivy**: Container security scanner
  - Docs: https://trivy.dev/
- **OWASP ZAP**: Web application security scanner
  - Docs: https://www.zaproxy.org/docs/

## GitOps & CI/CD

### GitOps

- **ArgoCD**: Declarative GitOps
  - Docs: https://argo-cd.readthedocs.io/
- **Flux**: GitOps toolkit
  - Docs: https://fluxcd.io/flux/

### CI/CD Platforms

- **Tekton**: Kubernetes-native CI/CD
  - Docs: https://tekton.dev/docs/
- **GitHub Actions**: GitHub's CI/CD
  - Docs: https://docs.github.com/en/actions

## Frontend Technologies

### Web Frameworks

- **React**: JavaScript library for UIs
  - Docs: https://react.dev/
- **React-Router framework mode**: [Fullstack routing library](https://reactrouter.com/start/modes#framework) SPA, SSR, and static rendering strategies
  - Docs: https://reactrouter.com/start/framework/installation

### Build Tools

- **Vite**: Fast build tool
  - Docs: https://vitejs.dev/guide/
- **Webpack**: Module bundler
  - Docs: https://webpack.js.org/concepts/
- **Parcel**: Zero-configuration build tool
  - Docs: https://parceljs.org/docs/

### CSS Specification - **AVOID CSS Frameworks**

- **MDN**: CSS Specification
  - Docs: https://developer.mozilla.org/en-US/docs/Web/CSS

## CLI Development

### CLI Frameworks

- **Typer** (Python): CLI framework
  - Docs: https://typer.tiangolo.com/
- **Click** (Python): CLI framework
  - Docs: https://click.palletsprojects.com/
- **Cobra** (Go): CLI framework
  - Docs: https://cobra.dev/
- **Clap** (Rust): CLI framework
  - Docs: https://docs.rs/clap/

### CLI Enhancement

- **Rich** (Python): Rich text and formatting
  - Docs: https://rich.readthedocs.io/
- **Inquirer**: Interactive CLI prompts
  - Docs: https://github.com/SBoudrias/Inquirer.js

## Backend Technologies

### Web Frameworks

- **FastAPI** (Python): Modern web framework
  - Docs: https://fastapi.tiangolo.com/
- **Django** (Python): Full-featured framework
  - Docs: https://docs.djangoproject.com/
- **Flask** (Python): Lightweight framework
  - Docs: https://flask.palletsprojects.com/
- **Express.js** (Node.js): Web framework
  - Docs: https://expressjs.com/
- **Spring Boot** (Java): Application framework
  - Docs: https://spring.io/projects/spring-boot

### API Standards

- **OpenAPI**: API specification
  - Docs: https://swagger.io/specification/
- **GraphQL**: Query language for APIs
  - Docs: https://graphql.org/learn/
- **gRPC**: High-performance RPC framework
  - Docs: https://grpc.io/docs/

## Persistence Layer

### Databases

- **XTDB**: Relational database
  - Docs: https://docs.xtdb.com/xtql/tutorials/introducing-xtql.html
- **PostgreSQL**: Relational database
  - Docs: https://www.postgresql.org/docs/
- **MongoDB**: Document database
  - Docs: https://docs.mongodb.com/
- **Redis**: In-memory data store
  - Docs: https://redis.io/docs/

### File Storage

- **MinIO**: Object storage
  - Docs: https://min.io/docs/
- **AWS S3**: Cloud object storage
  - Docs: https://docs.aws.amazon.com/s3/
- **Azure Blob Storage**: Cloud storage
  - Docs: https://docs.microsoft.com/en-us/azure/storage/blobs/

## Developer Tools

### Type Checking

- **mypy** (Python): Static type checker
  - Docs: https://mypy.readthedocs.io/
- **TypeScript**: Typed JavaScript
  - Docs: https://www.typescriptlang.org/docs/
- **Flow** (JavaScript): Static type checker
  - Docs: https://flow.org/en/docs/

### Code Formatting

- **Black** (Python): Code formatter
  - Docs: https://black.readthedocs.io/
- **Prettier**: Code formatter
  - Docs: https://prettier.io/docs/
- **rustfmt** (Rust): Code formatter
  - Docs: https://github.com/rust-lang/rustfmt

### Linting

- **Ruff** (Python): Fast linter
  - Docs: https://docs.astral.sh/ruff/
- **ESLint** (JavaScript): Linter
  - Docs: https://eslint.org/docs/
- **Clippy** (Rust): Linter
  - Docs: https://doc.rust-lang.org/clippy/

### Testing

- **pytest** (Python): Testing framework
  - Docs: https://docs.pytest.org/
- **Jest** (JavaScript): Testing framework
  - Docs: https://jestjs.io/docs/
- **JUnit** (Java): Testing framework
  - Docs: https://junit.org/junit5/docs/

### Pre-commit Hooks

- **pre-commit**: Git hook framework
  - Docs: https://pre-commit.com/

## Package Managers

### Python

- **uv**: Fast Python package manager
  - Docs: https://docs.astral.sh/uv/
- **pip**: Python package installer
  - Docs: https://pip.pypa.io/
- **Poetry**: Python dependency management
  - Docs: https://python-poetry.org/docs/

### Node.js

- **npm**: Node package manager
  - Docs: https://docs.npmjs.com/
- **yarn**: Package manager
  - Docs: https://yarnpkg.com/getting-started
- **pnpm**: Fast package manager
  - Docs: https://pnpm.io/

### Other Languages

- **Cargo** (Rust): Package manager
  - Docs: https://doc.rust-lang.org/cargo/
- **Maven** (Java): Build tool
  - Docs: https://maven.apache.org/guides/
- **Gradle** (Java): Build tool
  - Docs: https://docs.gradle.org/

## Environment Management

### Version Managers

- **mise**: Universal version manager
  - Docs: https://mise.jdx.dev/

### Virtual Environments

- **venv** (Python): Virtual environments
  - Docs: https://docs.python.org/3/library/venv.html

## Logging & Monitoring

### Logging

- **Loguru** (Python): Logging library
  - Docs: https://loguru.readthedocs.io/
- **Winston** (Node.js): Logging library
  - Docs: https://github.com/winstonjs/winston
- **ELK Stack**: Elasticsearch, Logstash, Kibana
  - Docs: https://www.elastic.co/guide/

### Monitoring

- **Prometheus**: Monitoring system
  - Docs: https://prometheus.io/docs/
- **Grafana**: Observability platform
  - Docs: https://grafana.com/docs/
- **Jaeger**: Distributed tracing
  - Docs: https://www.jaegertracing.io/docs/

## Configuration Management

### Configuration Formats

- **EDN**: Extensible Data Format
  - Docs: https://github.com/edn-format/edn
- **TOML**: Configuration format
  - Docs: https://toml.io/en/
- **YAML**: Data serialization
  - Docs: https://yaml.org/spec/
- **JSON**: Data interchange format
  - Docs: https://www.json.org/json-en.html

### Environment Variables

- **python-dotenv**: Load environment variables
  - Docs: https://github.com/theskumar/python-dotenv
- **dotenv**: Environment variables
  - Docs: https://github.com/motdotla/dotenv

## Usage Instructions

1. **Project Setup**: Reference relevant tools from this list in project-specific `implementation.md`
2. **Documentation**: Always include clickable URLs for Claude to reference
3. **Updates**: Keep this template updated with new tools and technologies
4. **Customization**: Adapt tool selections based on project requirements
