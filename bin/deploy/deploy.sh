#!/bin/bash -x
##	sudo ./bin/deploy.sh
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

	docker stack deploy -c "${NLB_COMPOSE_FPATH}" ${NLB_STACK_BASENAME}
}


################################################################################
##	main								      ##
################################################################################
function main()
{

	./bin/deploy/common/config.sh;
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
