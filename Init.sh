#!/bin/sh
# initialize rrfs_fix
#   --Guoqing Ge, 20210912
#
basedir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
utildir="$utildir"/.util

# set the pre-commit hook
echo -e "#!/bin/sh" > $basedir/.git/hooks/pre-commit
chmod +x $basedir/.git/hooks/pre-commit
echo -e "$utildir/git-fix-preCommit">>$basedir/.git/hooks/pre-commit

$utildir/make_link