#!/usr/bin/env bash
selected=`cat ~/.config/commons/.tmux-cht-languages ~/.config/commons/.tmux-cht-commands | fzf`
if [[ -z $selected ]]; then
    exit 0
fi

read -p "Enter Query: " query

if grep -qs "$selected" ~/.tmux-cht-languages; then
    echo 'is language'
    query=`echo $query | tr ' ' '+'`
    tmux neww bash -c "echo \"curl cht.sh/$selected/$query/\" & curl cht.sh/$selected/$query & while [ : ]; do sleep 1; done"
else
    echo 'is command'
    tmux neww bash -c "curl -s cht.sh/$selected/$query | less"
fi
