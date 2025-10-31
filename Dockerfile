#Dockerfile.
FROM searxng/searxng:2025.10.27-ea4a55fa5

# Create Default theme
RUN mv /usr/local/searxng/searx/templates/simple/ /usr/local/searxng/searx/templates/default/
RUN mv /usr/local/searxng/searx/static/themes/simple/ /usr/local/searxng/searx/static/themes/default/

# Cleanup new entrypoint
COPY docker-entrypoint.sh /tmp/docker-entrypoint.sh
RUN tr -d '\r' < /tmp/docker-entrypoint.sh > /usr/local/searxng/entrypoint.sh
RUN rm -f /tmp/docker-entrypoint.sh

EXPOSE 8080/tcp

LABEL maintainer="me@alandoyle.com"
