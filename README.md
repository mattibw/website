# Personal website — Matti Boie-Wegener

Clean academic site built with [Quarto](https://quarto.org), hosted free on
GitHub Pages, on a custom `.com` domain.

## 1. Preview locally
1. Install Quarto: <https://quarto.org/docs/get-started/> (it's a single installer).
2. In this folder run:
   ```bash
   quarto preview
   ```
   A live-reloading preview opens in your browser.

## 2. Fill in your content
Replace every `[placeholder]`, `REPLACE`, and `#` link, then add two files here:
- **`profile.jpg`** — your photo (square, ~600×600 px).
- **`cv.pdf`** — your CV (used on the CV page and the header link).

Files to edit: `index.qmd` (bio, links), `research.qmd` (papers + abstracts),
`teaching.qmd`, and the Scholar/SSRN/ORCID/LinkedIn URLs in `_quarto.yml`.

## 3. Put it on GitHub (free hosting)
1. Create a new **empty** repo on GitHub (e.g. `website`).
2. From this folder:
   ```bash
   git init
   git add -A
   git commit -m "Initial website"
   git branch -M main
   git remote add origin https://github.com/<user>/website.git
   git push -u origin main
   ```
3. The included Action (`.github/workflows/publish.yml`) renders the site and
   pushes it to a `gh-pages` branch on every push to `main`.
4. In **Settings → Pages**, set **Source = Deploy from a branch**, branch
   **`gh-pages`** / root. Your site goes live at
   `https://<user>.github.io/website/`.

## 4. Custom domain (`mattiboie-wegener.com`)
1. Buy the domain — **Cloudflare Registrar** (at-cost, ~$10/yr) or Namecheap.
2. In **Settings → Pages → Custom domain**, enter `mattiboie-wegener.com`
   (GitHub writes a `CNAME` file for you) and tick **Enforce HTTPS**.
3. At your domain's DNS, add:
   - `A` records for the apex `@` → `185.199.108.153`, `.109.153`, `.110.153`, `.111.153`
   - `CNAME` for `www` → `<user>.github.io`
4. HTTPS provisioning takes a few minutes to a few hours.

## Optional: dark mode
Add a dark toggle in `_quarto.yml`:
```yaml
    theme:
      light: [cosmo, theme.scss]
      dark: [darkly, theme.scss]
```

## Housekeeping
Keep only publicly available (e.g. SSRN) versions online. Don't post
confidential drafts, referee reports, or licensed data. A current short list
beats a long stale one.
