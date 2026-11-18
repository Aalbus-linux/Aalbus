# Aalbus website

Static project website. No build step and no external resources, so it can be
served from anywhere.

## Layout

- `index.html`, `about.html`, `get-started.html`, `repositories.html`, `contribute.html`
- `style.css`: all styling, including dark mode

## Publishing with GitHub Pages

The simplest route is a separate repository, for example `Aalbus-linux/aalbus.github.io`:

1. Create the repository in the organization.
2. Copy the contents of this directory to the repository root, or split it out
   of the main repository:

   ```bash
   git subtree split --prefix=website -b website-split
   git push <new-repo-url> website-split:main
   ```

3. In the repository settings, enable GitHub Pages from the `main` branch,
   root directory.

## Previewing locally

```bash
cd website
python3 -m http.server 8000
```

Then open http://localhost:8000.

## Before publishing

- Check the links to Reddit, Discord and GitHub still point to the right places.
- The package and hosting pages say nothing is published yet. Update them when
  the first install image and repository exist.
