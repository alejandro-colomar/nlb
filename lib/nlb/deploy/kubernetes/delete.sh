################################################################################
##      Copyright (C) 2020        Alejandro Colomar Andrés                    ##
##      SPDX-License-Identifier:  GPL-2.0-only                                ##
################################################################################
##
## Delete stack
## ============
##
################################################################################


################################################################################
##	source								      ##
################################################################################
source	etc/nlb/config.sh;


################################################################################
##	definitions							      ##
################################################################################


################################################################################
##	functions							      ##
################################################################################
function kube_delete()
{
	local	namespace="${NLB_STACK_BASENAME}";

	kubectl delete namespace "${namespace}";
}


################################################################################
##	end of file							      ##
################################################################################
