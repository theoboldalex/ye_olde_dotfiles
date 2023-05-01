#!/usr/bin/env bash

languages=`echo "lua c bash php golang" | tr ' ' '\n'`
core_utils=`echo "xargs find awk mv sed grep" | tr ' ' '\n'`

selected=`printf "$languages\n$core_utils" | fzf`
read -p "query: " query

if printf "%s" "$languages" | grep -qs $selected; then
    tmux neww bash -c "curl -s cht.sh/$selected/`echo $query | tr ' ' '+'` 2>&1 | less -R"
else
    tmux neww bash -c "curl -s cht.sh/$selected~$query | tr ' ' '+' & while [ : ]; do sleep 1; done"
fi

