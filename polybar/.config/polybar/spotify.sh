#!/usr/bin/env sh

main() {
  if ! pgrep -x spotify >/dev/null; then
    echo ""; exit
  fi

  eval $(sp eval)
  echo "$SPOTIFY_ARTIST - $SPOTIFY_TITLE"
}

main "$@"
