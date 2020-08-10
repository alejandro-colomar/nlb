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
source	etc/nlb/config.sh;
source	lib/nlb/deploy/common/config.sh;
source	lib/www/deploy/kubernetes/config.sh;


################################################################################
##	definitions							      ##
################################################################################


################################################################################
##	functions							      ##
################################################################################
## sudo
function kube_deploy()
{
	local	namespace="${NLB_STACK_BASENAME}";

	kubectl create namespace "${namespace}";
	kube_create_configmaps	"${namespace}";
	kubectl apply -f "etc/docker/kubernetes/deployment.yaml" -n "${namespace}";
	kubectl apply -f "etc/docker/kubernetes/network-policy.yaml" -n "${namespace}";
	kubectl apply -f "etc/docker/kubernetes/service.yaml" -n "${namespace}";
}


################################################################################
##	end of file							      ##
################################################################################
