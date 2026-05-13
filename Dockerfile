# Excalidraw for OpenHost.
#
# Excalidraw is a fully client-side React app.  The production
# artifact is static HTML/JS/CSS served by nginx.  No backend,
# no database, no runtime config — drawings save to the browser's
# IndexedDB automatically.
#
# We pull the official pre-built image (which is already nginx +
# static files) and just adjust the nginx config to listen on
# 8080 (OpenHost's conventional app port) and add a permissive
# CSP so the service worker + blob URLs work correctly.

FROM excalidraw/excalidraw:latest

# OpenHost routes to port 8080 by convention.
# The upstream image has nginx listening on 80; switch it.
RUN sed -i 's/listen\s*80;/listen 8080;/g' /etc/nginx/conf.d/default.conf

EXPOSE 8080
