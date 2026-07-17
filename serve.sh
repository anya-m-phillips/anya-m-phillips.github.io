#!/usr/bin/env bash
# Local preview for the site. Just run:  ./serve.sh
# Then open http://127.0.0.1:4000/ in your browser. Ctrl-C to stop.
#
# This script is self-contained: it activates rbenv (the Ruby version
# manager) and sets a UTF-8 locale, which the theme's Sass build requires.
set -euo pipefail

cd "$(dirname "$0")"

# Make rbenv + Homebrew available even if the shell hasn't loaded them.
export PATH="$HOME/.rbenv/shims:/opt/homebrew/bin:$PATH"
if command -v rbenv >/dev/null 2>&1; then
  eval "$(rbenv init - bash)"
fi

# The pinned Sass converter reads files as US-ASCII unless the locale is
# UTF-8; without this the build fails on the theme's non-ASCII characters.
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

exec bundle exec jekyll serve --livereload --host 127.0.0.1 --port 4000 "$@"
