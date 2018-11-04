#!/bin/bash
git pull
VIMRC=~/.vimrc
if [ `uname -s` = Darwin ]; then
    EXTENDED_REGEXP_KEY=E
    VRC_EXCLUDE='jlanzarotta/bufexplorer'
else
    EXTENDED_REGEXP_KEY=r
    VRC_EXCLUDE=XXXXXXX
fi
cat gred.src|sed "s/EXTENDED_REGEXP_KEY/$EXTENDED_REGEXP_KEY/" > gred
mkdir -p ~/.v.utils 2>/dev/null
for a in v gred svd cdr; do cp $a ~/.v.utils/; chmod +x ~/.v.utils/$a; done
rm gred
cat vimrc|grep -v $VRC_EXCLUDE > $VIMRC
[ -f ~/.bashrc ] && sed -i '/#_V_UTILS_BEGIN_/,/#_V_UTILS_END_/d' ~/.bashrc
cat <<EOM >>~/.bashrc
#_V_UTILS_BEGIN_
alias cdr='cd \$(~/.v.utils/cdr)'
alias gred='~/.v.utils/gred'
alias svd='~/.v.utils/svd'
alias v='~/.v.utils/v'
#_V_UTILS_END_
EOM
~/.v.utils/v --up
