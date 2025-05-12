
#Dockerfile.
FROM searxng/searxng:latest

RUN mv /usr/local/searxng/searx/templates/simple/ /usr/local/searxng/searx/templates/default/
RUN mv /usr/local/searxng/searx/static/themes/simple/ /usr/local/searxng/searx/static/themes/default/

COPY docker-entrypoint.sh /usr/local/searxng/container/docker-entrypoint.sh

EXPOSE 8080/tcp

LABEL maintainer="me@alandoyle.com"
