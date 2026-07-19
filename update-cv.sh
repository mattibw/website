#!/usr/bin/env bash
# Update the website CV from your Dropbox PDF and deploy it.
#
#   1. Set CV_SRC below to the compiled CV PDF in your Dropbox.
#   2. Make this runnable once:   chmod +x update-cv.sh
#   3. After editing the CV, run:  ./update-cv.sh
#
# GitHub Pages then redeploys automatically (~1-2 min).

set -euo pipefail

# --- set this to your actual CV PDF path in Dropbox --------------------------
CV_SRC="$HOME/Library/CloudStorage/Dropbox-Cobra.rp1/Matti Boie-Wegener (matti.boie-wegener)/Apps/Overleaf/CV/main.pdf"
# ----------------------------------------------------------------------------

REPO_DIR="$(cd "$(dirname "$0")" && pwd)"

if [[ ! -f "$CV_SRC" ]]; then
  echo "CV not found at: $CV_SRC"
  echo "Fix the CV_SRC path in update-cv.sh."
  exit 1
fi

cp "$CV_SRC" "$REPO_DIR/cv.pdf"
cd "$REPO_DIR"
git add cv.pdf

if git diff --cached --quiet; then
  echo "CV is already up to date — nothing to push."
  exit 0
fi

git commit -m "Update CV"
git push
echo "CV pushed. GitHub Pages will redeploy in ~1-2 minutes."
