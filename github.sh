#!/usr/bin/env bash

# To be done before:
# - export GITHUB_USER=...
# - export GITHUB_PASS=...
# - collection of .gitignore templates on https://github.com/github/gitignore

#
# def
#
CMD="push"        # default git command
MSG="left empty"  # default commit message
URL="https://${GITHUB_USER}:${GITHUB_PASS}@github.com/ges0909/ges0909.github.io.git"

#
# func
#
function usage()
{
  echo "github.sh [ -m | --message \"commit message\" ] <command>"
  echo "  commands are: init or push (default)"
}

function panic
{ # error handling
  for m in "$@"; do
    echo "PANIC: $m" >&2 # stderr
  done
  usage
  exit 1
}

function clone
{ # workflow for clone
  git clone "${URL}" blog
}

function push
{ # workflow for push
  
  # push all except 'public/' folder to 'source' branch
  git checkout source
  git add -A
  git commit -m "source branch: ${MSG}"
  git push origin source

  # generate site
  rm -rf public/* # remove including public/.git
  hugo
  
  # push 'public/' to master branch
  cd public/
  git checkout master
  git add -A
  git commit -m "master branch: ${MSG}"
  git push origin master
}

function init
{ # workflow for init

  # source branch
  rm -rf .git/
  rm -rf themes/

  git init
  git remote add origin "${URL}"
  git checkout -b source
  git add -A
  git commit -m "source branch: ${MSG}"

  # themes
  git subtree add --squash --prefix=themes/casper https://github.com/vjeantet/hugo-theme-casper.git master
# git subtree add --squash --prefix=themes/kasper https://github.com/ges0909/hugo-theme-kasper.git master
  git subtree add --squash --prefix=themes/slide https://github.com/ges0909/hugo-theme-slide.git master

  git push origin source

  # generate site
  rm -rf public/*
  hugo

  # master branch
  cd public/
  rm -rf .git/

  git init
  git remote add origin "${URL}"
  git add -A
  git commit -m "master branch: ${MSG}"
  git push origin master
}

#
# parse options
#
OPTS=`getopt --options m: --longoptions message: --name "$0" -- "$@"`

# check if 'getopt' suceeded
if (( "${?}" != 0 )); then
  panic "option error"
fi

eval set -- "${OPTS}";

# store option args to vars
while true; do
  case "${1}" in
    -m|--message) MSG="${2}"; shift 2 ;;
    --) shift; break ;;
    *) panic "unknown option error" ;;
  esac
done

# store remaining args (command)
if (( "${#@}" == 1 )); then
  CMD="${1}" # overwrite default
fi

# check command
case "${CMD}" in
  clone | init | push ) ;;
  * ) panic "unknown command '${CMD}', only 'init' or 'push' is allowed" ;;
esac

#
# run command
#
case "${CMD}" in
  clone) clone ;;
  init) init ;;
  push) push ;;
esac
