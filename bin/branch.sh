#!/bin/bash -x
##	./bin/branch.sh
################################################################################
##      Copyright (C) 2020        Alejandro Colomar Andrés                    ##
##      SPDX-License-Identifier:  GPL-2.0-only                                ##
################################################################################
##
## Prepare a branch
## ================
##
##  - Update version number
##  - Update exposed port
##  - Update stack name
##
################################################################################


################################################################################
##	source								      ##
################################################################################
source	lib/libalx/sh/sysexits.sh;

source	etc/www/config.sh;


################################################################################
##	definitions							      ##
################################################################################
ARGC=0;


################################################################################
##	functions							      ##
################################################################################


################################################################################
##	main								      ##
################################################################################
function main()
{
	local	branch="$(git branch --show-current)";

	./bin/release/port.sh		${NLB_PORT_EXP};
	./bin/release/stability.sh	"exp";
	./bin/release/version.sh;

	git commit -a -m "Branch: ${branch}";
}


################################################################################
##	run								      ##
################################################################################
argc=$#;
if [ ${argc} -ne ${ARGC} ]; then
	echo	"Illegal number of parameters (Requires ${ARGC})";
	exit	${EX_USAGE};
fi

main;


################################################################################
##	end of file							      ##
################################################################################
