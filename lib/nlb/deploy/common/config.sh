################################################################################
##      Copyright (C) 2020        Alejandro Colomar Andrés                    ##
##      SPDX-License-Identifier:  GPL-2.0-only                                ##
################################################################################
##
## Copy configs and secrets into /run/
## ===================================
##
################################################################################


################################################################################
##	source								      ##
################################################################################


################################################################################
##	definitions							      ##
################################################################################


################################################################################
##	functions							      ##
################################################################################
## sudo
function prepare_configs()
{

	mkdir -pv	/run/configs/;
	cp -fLrvT	run/configs/nlb/	/run/configs/nlb;
}

## sudo
function prepare_secrets()
{

	mkdir -pv	/run/secrets/;
	cp -fLrvT	run/secrets/nlb/	/run/secrets/nlb;
}


################################################################################
##	end of file							      ##
################################################################################