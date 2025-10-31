# Docker container for SearXNG
[![Docker Image Size](https://img.shields.io/docker/image-size/alandoyle/searxng/latest?logo=docker&style=for-the-badge)](https://hub.docker.com/r/alandoyle/searxng/tags)
[![Docker Pulls](https://img.shields.io/docker/pulls/alandoyle/searxng?label=Pulls&logo=docker&style=for-the-badge)](https://hub.docker.com/r/alandoyle/searxng)
[![Source](https://img.shields.io/badge/Source-GitHub-blue?logo=github&style=for-the-badge)](https://github.com/alandoyle/docker-searxng)

This is a Docker container for [SearXNG](https://searxng.org/).

---

[![SearXNG logo](https://images.weserv.nl/?url=raw.githubusercontent.com/alandoyle/docker-searxng/main/SearXNG-logo.svg&w=420)](https://searxng.org/)

Updated SearXNG Docker image with allows easier customisation.

---

## Docker

Available on [DockerHub](https://hub.docker.com/r/alandoyle/searxng)
```bash
docker pull alandoyle/searxng
```

---

## Usage

```bash
docker run --name=searxng \
  -d --init \
  -v <MY_CONFIG_PATH>:/etc/searxng \
  -v <MY_DATA_PATH>:/var/cache/searxng \
  -v <MY_TEMPLATE_PATH>:/usr/local/searxng/searx/templates/simple \
  -v <MY_THEME_PATH>:/usr/local/searxng/searx/static/themes/simple \
  -p 8000:8080/tcp \
  alandoyle/searxng:latest
```

Docker compose example:

```yaml
---
services:
  searxng:
   image: alandoyle/searxng:latest
   container_name: searxng
   restart: unless-stopped
   init: true
   ports:
     - "8000:8080/tcp"
   volumes:
     - ./searxng/config:/etc/searxng
     - ./searxng/data/:/var/cache/searxng
     - ./searxng/template:/usr/local/searxng/searx/templates/simple
     - ./searxng/theme:/usr/local/searxng/searx/static/themes/simple
```

---

### Ports

| Port       | Description           |
|------------|-----------------------|
| `8080/tcp` | HTTP                  |

---

### Volumes

| Path                                            | Description                            |
|-------------------------------------------------|----------------------------------------|
| `/etc/searxng`                                  | path for SearXNG configuration files   |
| `/var/cache/searxng`                            | path for SearXNG data/cache files      |
| `/usr/local/searxng/searx/templates/simple`     | path for SearXNG template files        |
| `/usr/local/searxng/searx/static/themes/simple` | path for SearXNG template static files |
