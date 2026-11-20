# bombatomica64.dev

Personal site, served at https://bombatomica64.dev.

A single static `index.html`: hand-written HTML, CSS and vanilla JS. The overworld map is an SVG generated at load time (seeded islands, paths, a camera that pans the viewBox). No build step, no dependencies besides Google Fonts.

The page opens on a console menu in the style of a cross-media bar: sections run left to right, the open section's items run top to bottom, and the selection stays put while everything else slides under it. The wave behind it is drawn on a canvas.

- **Projects** live in the `levels` array in `index.html`, grouped into the `worlds` above it. Each one needs a 1100x500 screenshot at `previews/<repo name, lowercased>.webp` and a position on the map.
- **Contributions** to other people's projects live in the `coop` array, one entry per repository, and show as the Co-op section. The merged counts are typed in by hand from GitHub search (`author:Bombatomica64 is:pr is:merged repo:<repo>`).
- **Pages** (player file, inventory, save points) are plain HTML at the bottom of the file. The script moves them into the console, where they open over the menu; without the script they read as an ordinary page.
- **Addresses**: every item has one. `/#smelt` selects a project, `/#inventory` opens a page, `/#map` opens the map.
- **Sound** is synthesised in the browser and off until turned on from the bottom bar.

## Run locally

Open `index.html` in a browser, or run the image:

```bash
docker build -t bombatomica64 . && docker run --rm -p 8080:8080 bombatomica64
```

## Deploy

Push to `main`. The image builder on the home k3s box (`image-builder@bombatomica64` in `CodeDrevia/simple-server`) notices the new commit within a couple of minutes. It builds this Dockerfile and pushes `ghcr.io/codedrevia/bombatomica64:<short-sha>`. Then it bumps the tag in `apps/bombatomica64/values.yaml`, and ArgoCD rolls the pod.

Logs: `journalctl -u image-builder@bombatomica64` on the box.
