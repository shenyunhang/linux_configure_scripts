#!/bin/bash

set -e
set -x


#su git
SCRIPTPATH="$( cd "$(dirname "$0")" ; pwd -P )"




input="${SCRIPTPATH}/list.txt"
while IFS= read -r line
do
	echo "$line"
	if [ "$line" == "" ];then
		echo NULL
		continue
	fi
	FILE='/home/git/'${line}
	if [ -d "$FILE" ]; then
		echo '${line} exist'
		cd ${FILE}
		#git fetch git@github.com:${line}
		git remote update
	else
		#git clone https://github.com/${line} ${FILE}
		#git clone --bare git@github.com:${line} ${FILE}
		git clone --mirror git@github.com:${line} ${FILE}
	fi
done < "$input"

