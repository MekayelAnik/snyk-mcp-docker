<p align="center"><img src="https://res.cloudinary.com/snyk/image/upload/v1537345894/press-kit/brand/logo-black.png" alt="Snyk Logo" width="200"></p>

# Snyk CLI MCP Server - Docker Image

<p align="center">
  <strong>Unofficial Multi-Architecture Docker Image for Snyk CLI MCP Server</strong>
</p>

<p align="center">
  <a href="https://hub.docker.com/r/mekayelanik/snyk-mcp"><img alt="Docker Pulls" src="https://img.shields.io/docker/pulls/mekayelanik/snyk-mcp?style=flat-square&logo=docker"></a>
  <a href="https://hub.docker.com/r/mekayelanik/snyk-mcp"><img alt="Docker Stars" src="https://img.shields.io/docker/stars/mekayelanik/snyk-mcp?style=flat-square&logo=docker"></a>
  <a href="https://github.com/mekayelanik/snyk-mcp-docker/pkgs/container/snyk-mcp"><img alt="GHCR" src="https://img.shields.io/badge/GHCR-ghcr.io%2Fmekayelanik%2Fsnyk-mcp-blue?style=flat-square&logo=github"></a>
  <a href="https://github.com/mekayelanik/snyk-mcp-docker/blob/main/LICENSE"><img alt="License: GPL-3.0" src="https://img.shields.io/badge/License-GPL--3.0-blue?style=flat-square"></a>
  <a href="https://hub.docker.com/r/mekayelanik/snyk-mcp"><img alt="Platforms" src="https://img.shields.io/badge/Platforms-amd64%20%7C%20arm64-lightgrey?style=flat-square"></a>
  <a href="https://github.com/MekayelAnik/snyk-mcp-docker/stargazers"><img alt="GitHub Stars" src="https://img.shields.io/github/stars/MekayelAnik/snyk-mcp-docker?style=flat-square"></a>
  <a href="https://github.com/MekayelAnik/snyk-mcp-docker/forks"><img alt="GitHub Forks" src="https://img.shields.io/github/forks/MekayelAnik/snyk-mcp-docker?style=flat-square"></a>
  <a href="https://github.com/MekayelAnik/snyk-mcp-docker/issues"><img alt="GitHub Issues" src="https://img.shields.io/github/issues/MekayelAnik/snyk-mcp-docker?style=flat-square"></a>
  <a href="https://github.com/MekayelAnik/snyk-mcp-docker/commits/main"><img alt="Last Commit" src="https://img.shields.io/github/last-commit/MekayelAnik/snyk-mcp-docker?style=flat-square"></a>
</p>

## Overview

This is an unofficial, community-maintained Docker image that packages the [Snyk CLI MCP Server](https://github.com/snyk/studio-mcp) for containerized deployment. It enables AI agents (Claude Code, VS Code Copilot, Cursor, Windsurf, etc.) to perform security scanning via the Model Context Protocol (MCP).

**Upstream:** [github.com/snyk/cli](https://github.com/snyk/cli) (Apache License 2.0)

### Key Features

- **Multi-Architecture Support** - Native support for x86-64 and ARM64
- **Multiple Transport Protocols** - Streamable HTTP, SSE, and WebSocket support (selectable via env var)
- **11 Security Scanning Tools** - SCA, SAST, container, IaC, SBOM, and AIBOM scanning
- **Python AI Project Support** - `snyk_aibom` for AI Bill of Materials generation
- **Secure by Design** - API key auth (case-insensitive Bearer), CORS, TLS termination, security headers
- **High Performance** - HAProxy with QUIC/HTTP3 support, ZSTD compression

### Available Snyk MCP Tools

| Tool | Description |
|:-----|:------------|
| `snyk_sca_scan` | Open source dependency vulnerability scanning (pip, pipenv, poetry, npm, etc.) |
| `snyk_code_scan` | Static Application Security Testing (SAST) for source code |
| `snyk_container_scan` | Container image vulnerability scanning |
| `snyk_iac_scan` | Infrastructure as Code security scanning (Terraform, K8s, Docker Compose) |
| `snyk_sbom_scan` | Software Bill of Materials analysis |
| `snyk_aibom` | AI Bill of Materials for Python AI projects (models, datasets, tools) |
| `snyk_auth` | Authenticate with Snyk |
| `snyk_logout` | Log out of Snyk |
| `snyk_auth_status` | Check authentication status |
| `snyk_trust` | Trust a folder for scanning |
| `snyk_version` | Display version information |

---

## 😎 Buy Me a Coffee ☕︎
**Your support encourages me to keep creating/supporting my open-source projects.** If you found value in this project, you can buy me a coffee to keep me inspired.

<p align="center">
<a href="https://07mekayel07.gumroad.com/coffee" target="_blank">
<img src="https://cdn.buymeacoffee.com/buttons/v2/default-yellow.png" alt="Buy Me A Coffee" width="217" height="60">
</a>
</p>

## Quick Start

### Prerequisites

- **Docker Engine:** 23.0+
- **Snyk Account:** Free tier available at [app.snyk.io](https://app.snyk.io)
- **Snyk API Token:** From [app.snyk.io/account](https://app.snyk.io/account) (API Token section)

> **CRITICAL:** Do NOT expose this container directly to the internet without proper security measures (reverse proxy, SSL/TLS, authentication, firewall rules).

---

### Docker Compose (Recommended)

```yaml
services:
  snyk-mcp:
    image: mekayelanik/snyk-mcp:latest
    container_name: snyk-mcp
    restart: unless-stopped
    ports:
      - "8010:8010"
    volumes:
      - /path/to/your/projects:/data:ro
    environment:
      - SNYK_TOKEN=${SNYK_TOKEN}
      - PORT=8010
      - INTERNAL_PORT=38011
      - PUID=1000
      - PGID=1000
      - TZ=UTC
      - NODE_ENV=production
      - PROTOCOL=SHTTP
      - ENABLE_HTTPS=false
      - HTTP_VERSION_MODE=auto
      - DATA_DIR=/data
      - SNYK_MCP_PROFILE=full
      # Optional: Snyk organization ID
      # - SNYK_CFG_ORG=your-org-id
      # Optional: require Bearer token auth at HAProxy layer
      # - API_KEY=replace-with-strong-secret
      # Optional: CORS origins
      # - CORS=*
```

### Docker Run

```bash
docker run -d \
  --name=snyk-mcp \
  --restart=unless-stopped \
  -p 8010:8010 \
  -v /path/to/your/projects:/data:ro \
  -e SNYK_TOKEN=your-snyk-api-token \
  -e PORT=8010 \
  -e PROTOCOL=SHTTP \
  -e SNYK_MCP_PROFILE=full \
  mekayelanik/snyk-mcp:latest
```

### Access Endpoints

| Service | Endpoint | Description |
|:--------|:---------|:------------|
| **MCP (SHTTP)** | `http://host-ip:8010/mcp` | Streamable HTTP MCP endpoint (recommended) |
| **MCP (SSE)** | `http://host-ip:8010/sse` | Server-Sent Events MCP endpoint |
| **MCP (WS)** | `ws://host-ip:8010/message` | WebSocket MCP endpoint |
| **Health** | `http://host-ip:8010/healthz` | Health check endpoint |

When HTTPS is enabled (`ENABLE_HTTPS=true`), use TLS endpoints:

| Service | Endpoint |
|:--------|:---------|
| **MCP (SHTTP)** | `https://host-ip:8010/mcp` |
| **MCP (SSE)** | `https://host-ip:8010/sse` |
| **MCP (WS)** | `wss://host-ip:8010/message` |

> **Security Warning:** The container defaults to HTTP (`ENABLE_HTTPS=false`) for easier local setup. Use `ENABLE_HTTPS=true` with your own certificates for production. See [CERTIFICATE_SETUP_GUIDE.md](CERTIFICATE_SETUP_GUIDE.md) for instructions.

---

## Configuration

### Complete Environment Variables Reference

#### Core Settings

| Variable | Default | Possible Values | Description |
|:---------|:-------:|:----------------|:------------|
| `PORT` | `8010` | `1`-`65535` | External HAProxy listening port |
| `INTERNAL_PORT` | `38011` | `1`-`65535` | Internal supergateway port (do not expose) |
| `PROTOCOL` | `SHTTP` | `SHTTP`, `SSE`, `WS` | MCP transport protocol |
| `PUID` | `1000` | Any valid UID | Process user ID |
| `PGID` | `1000` | Any valid GID | Process group ID |
| `TZ` | `UTC` | Any timezone | Container timezone |
| `NODE_ENV` | *(empty)* | `production`, etc. | Node.js environment |
| `DATA_DIR` | `/data` | Any path | Directory for mounted projects |

#### Snyk Settings

| Variable | Default | Possible Values | Description |
|:---------|:-------:|:----------------|:------------|
| `SNYK_TOKEN` | *(empty)* | API token string | Snyk API token (required for scanning) |
| `SNYK_CFG_ORG` | *(empty)* | Organization ID | Snyk organization ID |
| `SNYK_MCP_PROFILE` | `full` | `minimal`, `full`, `preview` | Tool profile (see below) |
| `SNYK_DEBUG` | `false` | `true`, `false` | Enable debug logging |
| `SNYK_DISABLE_ANALYTICS` | *(empty)* | `1` | Disable Snyk analytics |

#### Snyk MCP Profiles

| Profile | Tools | Description |
|:--------|:-----:|:------------|
| `minimal` | Essential | Minimum scanning tools, low token usage |
| `full` | 11 | All stable tools (recommended) |
| `preview` | 11+ | Full profile plus experimental tools |

#### Security Settings

| Variable | Default | Possible Values | Description |
|:---------|:-------:|:----------------|:------------|
| `API_KEY` | *(empty)* | 5-256 printable chars | Bearer token for HAProxy authentication |
| `CORS` | *(empty)* | Origins (comma-separated) or `*` | Allowed CORS origins |
| `ENABLE_HTTPS` | `false` | `true`, `false` | Enable TLS termination |
| `TLS_CERT_PATH` | `/etc/haproxy/certs/server.crt` | File path | TLS certificate path |
| `TLS_KEY_PATH` | `/etc/haproxy/certs/server.key` | File path | TLS private key path |
| `TLS_MIN_VERSION` | `TLSv1.3` | `TLSv1.2`, `TLSv1.3` | Minimum TLS version |
| `HTTP_VERSION_MODE` | `auto` | `auto`, `h1`, `h2`, `h3`, `h1+h2`, `all` | HTTP version negotiation |

> **Boolean values:** `true`, `1`, `yes`, `on` are all accepted as truthy. Everything else is falsy.

---

## Mounting Projects for Scanning

Mount your project directories to `/data` (or the path specified by `DATA_DIR`). Each subdirectory becomes a scannable project.

```yaml
volumes:
  # Mount entire projects directory
  - /home/user/projects:/data:ro
  # Or mount individual projects
  - /home/user/my-python-app:/data/my-python-app:ro
  - /home/user/my-node-app:/data/my-node-app:ro
```

Then tell your AI agent to scan using the mounted path:
- "Scan `/data/my-python-app` for vulnerabilities"
- "Run an SCA scan on `/data/my-node-app`"
- "Generate an AIBOM for `/data/my-python-app`"

---

## MCP Client Configuration

### Claude Code

Add to `~/.claude.json` under `mcpServers`:

```json
{
  "mcpServers": {
    "snyk": {
      "type": "sse",
      "url": "http://host-ip:8010/sse"
    }
  }
}
```

Or for Streamable HTTP:

```json
{
  "mcpServers": {
    "snyk": {
      "type": "http",
      "url": "http://host-ip:8010/mcp"
    }
  }
}
```

### VS Code / Codex / Cursor / Windsurf

All use the same JSON format. Configure in the respective config file:
- **VS Code**: `.vscode/settings.json` (key: `mcp.servers`)
- **Codex**: `~/.codex/config.json` (key: `mcpServers`)
- **Cursor**: `~/.cursor/mcp.json` (key: `mcpServers`)
- **Windsurf**: `.codeium/mcp_settings.json` (key: `mcpServers`)

```json
{
  "mcpServers": {
    "snyk": {
      "transport": "http",
      "url": "http://host-ip:8010/mcp"
    }
  }
}
```

---

## Available Tags

| Tag | Platform | Description |
|:----|:---------|:------------|
| `latest` | `amd64`, `arm64` | Latest stable release |
| `1.1303.2` | `amd64`, `arm64` | Specific version |

---

## License

This Docker image packaging is licensed under the [GNU General Public License v3.0](LICENSE).

### Upstream Licenses

- **Snyk CLI**: [Apache License 2.0](https://github.com/snyk/cli/blob/main/LICENSE) - Copyright 2015 Snyk Ltd.
- **Supergateway**: MIT License
- **HAProxy**: GNU General Public License v2.0

This is an **unofficial** community packaging. It is NOT affiliated with, endorsed by, or supported by Snyk Ltd. See [NOTICE](NOTICE) for full attribution.

---

## 😎 Buy Me a Coffee ☕︎
**Your support encourages me to keep creating/supporting my open-source projects.** If you found value in this project, you can buy me a coffee to keep me inspired.

<p align="center">
  <a href="https://07mekayel07.gumroad.com/coffee" target="_blank">
    <img src="https://cdn.buymeacoffee.com/buttons/v2/default-yellow.png" alt="Buy Me A Coffee" width="217" height="60">
  </a>
</p>

---

## Maintainer

**Mohammad Mekayel Anik**

- Docker Hub: [mekayelanik](https://hub.docker.com/u/mekayelanik)
- GitHub: [MekayelAnik](https://github.com/MekayelAnik)
