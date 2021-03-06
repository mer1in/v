#!/bin/bash
# Search for filename in parameters and subst linenum with '+/' prefix if it does not exist, ie
# myfile:122:32 open myfile @line 122
if [ "$1" = "--up" ]; then
    echo Up
    [ -f ~/.vim/bundle/Vundle.vim/README.md ] || \
        git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
    vim +PluginInstall +qall
    exit
fi
for arg in $@ ;do
    [ -z "`echo $arg|sed 's^+/.*^^'`" ] && SEARCH=$arg
    [ -n "`echo $arg|sed 's^+/.*^^'`" ] && FILES="$FILES `echo $arg|sed 's^:.*^^'`"
    [ -z "$SEARCH" ] && SEARCH="`echo $arg|grep ':'|sed 's/[^:]*:\([0-9]*\).*/\1/'`" &&\
        [ -n "$SEARCH" ] && SEARCH="+$SEARCH"
done
vim $SEARCH $FILES
