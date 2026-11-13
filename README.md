# bombatomica64.dev

Personal site, served at https://bombatomica64.dev.

A single static `index.html`: hand-written HTML, CSS and vanilla JS. The overworld map is an SVG generated at load time (seeded islands, paths, a camera that pans the viewBox). No build step, no dependencies besides Google Fonts.

## Run locally

Open `index.html` in a browser, or run the image:

```bash
docker build -t bombatomica64 . && docker run --rm -p 8080:8080 bombatomica64
```

## Deploy

Push to `main`. The image builder on the home k3s box (`image-builder@bombatomica64` in `CodeDrevia/simple-server`) notices the new commit within a couple of minutes. It builds this Dockerfile and pushes `ghcr.io/codedrevia/bombatomica64:<short-sha>`. Then it bumps the tag in `apps/bombatomica64/values.yaml`, and ArgoCD rolls the pod.

Logs: `journalctl -u image-builder@bombatomica64` on the box.
