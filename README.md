# docker-searxng

![SearXNG](https://raw.githubusercontent.com/searxng/searxng/master/src/brand/searxng.svg)

Updated SearXNG Docker image with allows easier customisation.

## Docker 

Available on [DockerHub](https://hub.docker.com/r/alandoyle/searxng)
```bash
docker pull alandoyle/searxng
```

## Usage

```bash
docker run --name=searxng \
  -d --init \
  -v <MY_CONFIG_PATH>:/etc/searxng \
  -v <MY_TEMPLATE_PATH>:/usr/local/searxng/searx/templates/simple \
  -v <MY_THEME_PATH>:/usr/local/searxng/searx/static/themes/simple \
  -p 8000:8080/tcp \
  alandoyle/searxng:latest
```

Docker compose example:

```yaml
version: "3"

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
     - ./searxng/template:/usr/local/searxng/searx/templates/simple
     - ./searxng/theme:/usr/local/searxng/searx/static/themes/simple
```

### Ports

| Port       | Description           |
|------------|-----------------------|
| `8080/tcp` | HTTP                  |

### Volumes

| Path                                               | Description                           |
|-------------------------------------------------|---------------------------------------|
| `/etc/searxng`                                  | path for SearXNG configuration files |
| `/usr/local/searxng/searx/templates/simple`     | path for SearXNG temolate files          |
| `/usr/local/searxng/searx/static/themes/simple` | path for SearXNG theme files          |
