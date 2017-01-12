#!/usr/bin/env bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
SYMLINKS=(
    ".bash_profile"
    ".bash_prompt"
    ".django_bash_completion"
    ".fabric_completion.bash"
    ".gitignore"
    ".ngrok2"
    ".iterm2"
    ".config"
    ".atom"
    ".aws"
    ".virtualenvhooks"
    "redis.conf"
)
COPY=(
    ".gitconfig"
)
for i in "${SYMLINKS[@]}"
do
    if [ -e ~/$i ]; then
      echo "=> ~/$i already exists"
    else
      ln -s $DIR/$i ~/$i
      echo "=> symlinked ~/$i"
    fi
done

for i in "${COPY[@]}"
do
    if [ -e ~/$i ]; then
      echo "=> ~/$i already exists"
    else
      cp $DIR/$i ~/$i
      echo "=> copy ~/$i"
    fi
done
