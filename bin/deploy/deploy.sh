#!/bin/bash -x
##	./bin/deploy.sh
################################################################################
##      Copyright (C) 2020        Alejandro Colomar Andrés                    ##
##      SPDX-License-Identifier:  GPL-2.0-only                                ##
################################################################################
##
## Deploy stack
## ============
##
################################################################################


################################################################################
##	source								      ##
################################################################################
source	lib/libalx/sh/sysexits.sh;

source	etc/nlb/config.sh;


################################################################################
##	definitions							      ##
################################################################################
ARGC=0;


################################################################################
##	functions							      ##
################################################################################
function deploy_stack()
{
	local	stack_name="${NLB_STACK_BASENAME}_${NLB_STABILITY}";

	docker stack deploy -c "${NLB_COMPOSE_FPATH}" ${stack_name}
}


################################################################################
##	main								      ##
################################################################################
function main()
{

	./bin/deploy/config.sh;
	deploy_stack;
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
