#!/bin/bash

"${ROOTDIR?"Expected env var ROOTDIR not set"}"

function replace_line {
  printf "\r%s %s: %s\033[K" "$1" "$2" "$3"
}
function finish_line {
  echo -ne '\n'
}

for DIRECTORY in $ROOTDIR/*; do
  REPOSITORY=${DIRECTORY##*/}
  replace_line "ℹ️ " $REPOSITORY "updating"
  cd $DIRECTORY
  BRANCH=$(git rev-parse --abbrev-ref HEAD 2>/dev/null)
  if [[ $BRANCH != "main" && $BRANCH != "develop" ]]; then
    replace_line "⛔️" $REPOSITORY "invalid branch \"$BRANCH\"" && finish_line
    continue;
  fi
  git pull >/dev/null 2>&1
  replace_line "✅" $REPOSITORY "updated" && finish_line
done
