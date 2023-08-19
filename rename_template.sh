#!/bin/bash
cd "$( cd "$( dirname "$0" )"; pwd )"

# Prepare cmd-line parsing
show_help() {
    cat << EOF
Rename package to your preferred project name.

Usage: $( basename $0 ) <NEW_NAME>

Arguments:

    NEW_NAME       New project name.

EOF
}
if [ -z "$1" ]; then show_help; exit 1; fi

# Clean up code base
make clean

# Rename module
mv -v my_module "$1"

# Replace module references with new name
find . -type f -exec grep -l my_module {} + |\
grep -v -e $( basename $0 ) -e ".git" |while read file
do
    echo "- RENAME $file"
    sed -i.rename-bak "s/my_module/$1/g" $file
done
# Reset version
sed -i.rename-bak "s/version = .*/version = \"0.0.1\"/g" pyproject.toml

# Overwrite README file
cat <<EOF >README.md
# ${1}
EOF

# Clean up
find . -type f -iname "*.rename-bak" -exec rm -f {} \;
rm -f $( basename $0 ) CHANGELOG.md
