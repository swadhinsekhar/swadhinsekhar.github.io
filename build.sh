#/bin/bash

GITBOOK=/opt/work/gitbook
WEB_DIR=`pwd`

git pull

echo "coping *.md file to " $GITBOOK
cp *.md $GITBOOK

cd $GITBOOK
gitbook build

echo "coping gitbook generated file to " $WEB_DIR
cp -r _book/* $WEB_DIR
cd $WEB_DIR

git add --all
git commit -m "added new files"
git push -u origin master
