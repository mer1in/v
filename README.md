cmd line tools
==============

ctrl+c ctrl+v
-------------
> `cd; git clone https://github.com/mer1in/v; cd v && ./install.sh`

v
-
open file my-file @line 122
> `v my-file:122:`

gred 
----
grep and edit
> `gred 'sed .*A'`

```
1:./gred:26:    (sed -e 's,\x1B\[[0-9;]*[a-zA-Z],,g' -e 's,:.*,,'|sort -u)`" 
2:./README.md:12:> `gred 'sed .*A'`
3:./README.md:16:2:./gred:26:    (sed -e 's,\x1B\[[0-9;]*[a-zA-Z],,g' -e 's,:.*,,'|sort -u)`" 
4:./svd:3:[ -z "$1" ] && { $0 -l|sed "s/^[ARM]\s*//" ; exit ; }
5:./v:6:    [ -z "`echo $arg|sed 's^+/.*^^'`" ] && SEARCH=$arg
6:./v:8:    [ -z "$SEARCH" ] && SEARCH="`echo $arg|grep ':'|sed 's/[^:]*:\([0-9]*\).*/\1/'`" && [ -n "$SEARCH" ] && SEARCH="+$SEARCH"
    4 files found
```
> `3`
opens file README.md on line 16 with expr `sed .*A` in search buffer

svd
---
simplify svn diff:
```
svd [-c|-l|-a|-r|<filename>]
no params - list of changed files
-l - list of changed files with status
-c - colordiff all changes
<filename> - vimdiff changed file
-a - vimdiff all changed files
-r - revert all changes
```

cdr
---
go to the project root

install.sh
----------
update && set aliases in ~/.bashrc

todo
----
gred
- add keys:
    - --name '*.ext':  search only ext files
- choose multiple files to open

svd
- support git

vimrc
- buffexplorer @darwin
- load first cmd on open from ~/.vimrc_run_cmds
