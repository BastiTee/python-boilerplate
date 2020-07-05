#!/bin/bash
cd "$( cd "$( dirname "$0" )"; pwd )"

show_help() {
    cat << EOF
Rename 'my_module' to your preferred project name.

Usage: $( basename $0 ) <NEW_NAME>

Arguments:

    NEW_NAME       New project name.

EOF
}

if [ -z "$1" ]; then show_help; exit 1; fi

make clean
rm -rf "$1"
mv -v my_module "$1"
find . -type f -exec grep -l my_module {} + |\
grep -v -e $( basename $0 ) -e ".git" |while read file
do
    echo "- RENAME $file"
    sed -i.rename-bak "s/my_module/$1/g" $file
done
find . -type f -iname "*.rename-bak" -exec rm -f {} \;
