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
NLB_PROJECT="nlb";
NLB_STACK="${NLB_PROJECT}";


################################################################################
##	end of file							      ##
################################################################################
