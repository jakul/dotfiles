#!/usr/bin/env bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
FILES=(
    ".bash_profile"
    ".bash_prompt"
    ".django_bash_completion"
    ".fabric_completion.bash"
    ".gitconfig"
    ".gitignore"
    ".ngrok2"
)
for i in "${FILES[@]}"
do
    if [ -e ~/$i ]; then
      echo "=> ~/$i already exists"
    else
      ln -s $DIR/$i ~/$i
      echo "=> symlinked ~/$i"
    fi
done
