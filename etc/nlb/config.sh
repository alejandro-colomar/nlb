##	source	/lib/libalx/sh/sysexits.sh
################################################################################
##      Copyright (C) 2020        Alejandro Colomar Andrés                    ##
##      SPDX-License-Identifier:  BSD-2-Clause                                ##
################################################################################


################################################################################
##	include guard							      ##
################################################################################
if [ -n "${NLB_CONFIG_H}" ]; then
	return;
fi
NLB_CONFIG_H="/etc/nlb/config.sh included";


################################################################################
##	definitions							      ##
################################################################################
NLB_COMPOSE_FPATH="etc/docker/swarm/docker-compose.yaml";
NLB_PORT_EXP=32080;
NLB_PORT_RC=31080;
NLB_PORT_STABLE=30080;
NLB_STABILITY="exp";	## "stable", "rc", or "exp"
NLB_STACK_BASENAME="nlb";
NLB_VERSION="master";	## tag name or branch name.


################################################################################
##	end of file							      ##
################################################################################
