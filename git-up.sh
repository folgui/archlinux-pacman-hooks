#!/usr/bin/env bash
# -*- ENCODING: UTF-8 -*-

##################################################################################################################
# Author    : J. Miguel Folgueira <folguidroid@gmail.com>
# Website   : https://folgui.synology.me/
##################################################################################################################

###############################################################################
#tput setaf 0 = black
#tput setaf 1 = red
#tput setaf 2 = green
#tput setaf 3 = yellow
#tput setaf 4 = dark blue
#tput setaf 5 = purple
#tput setaf 6 = cyan
#tput setaf 7 = gray
#tput setaf 8 = light blue
#tput sgr0 = reset color
###############################################################################

# reset - commit your changes or stash them before you merge
# git reset --hard - ArcoLinux alias - grh

# reset - go back one commit - all is lost
# git reset --hard HEAD~1

# remove a file online but keep it locally
# https://www.baeldung.com/ops/git-remove-file-without-deleting-it
# git rm --cached file.txt

echo
# checking if I have the latest files from github
echo "* Checking for newer files online first..."
git pull

workdir=$(pwd)

echo
# Below command will backup everything inside the project folder
git add --all .

echo
# Give a comment to the commit if you want
echo "* Write your commit comment!"
read input
# Committing to the local repository with a message containing the time details and commit text
git commit -m "$input"

echo
# Push the local files to github
if grep -q main .git/config; then
	echo "Using main"
	git push -u origin main
fi

if grep -q master .git/config; then
	echo "Using master"
	git push -u origin master
fi
# force the matter
# git push -u origin master --force

echo
tput setaf 2
echo "#############################################"
echo "############### GIT PUSH DONE ###############"
echo "#############################################"
tput sgr0
echo

exit 0


