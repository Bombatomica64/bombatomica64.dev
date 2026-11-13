# bombatomica64.dev

Personal site, served at https://bombatomica64.dev.

A single static `index.html`: hand-written HTML, CSS and vanilla JS. The overworld map is an SVG generated at load time (seeded islands, paths, a camera that pans the viewBox). No build step, no dependencies besides Google Fonts.

## Run locally

Open `index.html` in a browser, or `python3 -m http.server`.

## Deploy

It runs as a pod on the home k3s cluster via ArgoCD, from `apps/bombatomica64` in `CodeDrevia/simple-server`. That chart currently carries its own copy of the page in `site/index.html`, so a change here must be copied there and merged to go live.
