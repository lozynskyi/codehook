#!/bin/sh

export TERM=xterm-color
PROJECT=`php -r "echo dirname(dirname(dirname(realpath('$0'))));"`
STAGED_FILES_CMD=`git diff --cached --name-only --diff-filter=ACMR HEAD | grep \\\\.php`

black=`tput setaf 0`
bold=`tput bold`

b_red=`tput setab 1`
b_green=`tput setab 2`
b_yellow=`tput setab 3`
reset=`tput sgr0`

# Determine if a file list is passed
if [ "$#" -eq 1 ]
then
	oIFS=$IFS
	IFS='
	'
	SFILES="$1"
	IFS=$oIFS
fi
SFILES=${SFILES:-$STAGED_FILES_CMD}

echo "${bold}${b_yellow}${black}Checking PHP Lint...${reset}"
for FILE in $SFILES
do
	php -l -d display_errors=0 $PROJECT/$FILE
	if [ $? != 0 ]
	then
		echo "${bold}${b_red}${black}Fix the SYNTAX ERROR before commit!!! ${reset}"
		exit 1
	fi
	FILES="$FILES $PROJECT/$FILE"
done

if [ "$FILES" != "" ]
then
	echo "${bold}${b_yellow}${black}Running Code Sniffer...${reset}"
	./vendor/bin/phpcs --standard=PSR2 --encoding=utf-8 -n -p $FILES
	if [ $? != 0 ]
	then
		echo "${bold}${b_red}${black}Code Style problem detected:${reset}"


		for FILE in $SFILES
    do
      echo "${b_red}${black} ${FILE} ${reset}"
    done

	  echo "${bold}${b_green}${black}Auto code PSR2 fixing applying...${reset}"

		if [[ "$OSTYPE" == "darwin"* ]]; then
        git status -s "*.php" | grep -v '^(R|D)' | awk '{print $2}' |  xargs -I{} vendor/bin/phpcbf --standard=PSR2 --encoding=utf-8 --ignore=migrations {}
    else
        git status -s *.php | grep -v -P '^(R|D)' | awk '{print $2}' | tr "\n" " " | xargs -r  vendor/bin/phpcbf -v -p --standard=PSR2 --encoding=utf-8 --ignore=migrations
    fi
	  echo "${bold}${b_yellow}${black}Please review and commit it again! ${reset}"
		exit 1
	fi
fi

exit $?
