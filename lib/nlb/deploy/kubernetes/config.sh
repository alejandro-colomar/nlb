################################################################################
##      Copyright (C) 2020        Alejandro Colomar Andrés                    ##
##      SPDX-License-Identifier:  GPL-2.0-only                                ##
################################################################################
##
## Generate the config maps
## ========================
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
function kube_create_configmaps()
{
	local	namespace="$1";

	kubectl create configmap "etc-nginx-cm"				\
		--from-file "/run/configs/nlb/etc/nginx/nginx.conf"	\
		-n "${namespace}";

	kubectl create configmap "etc-nginx-confd-cm"			\
		--from-file "/run/configs/nlb/etc/nginx/conf.d/nlb.conf" \
		--from-file "/run/configs/nlb/etc/nginx/conf.d/www.conf" \
		--from-file "/run/configs/nlb/etc/nginx/conf.d/www_ports_exp.conf" \
		--from-file "/run/configs/nlb/etc/nginx/conf.d/www_ports_rc.conf" \
		--from-file "/run/configs/nlb/etc/nginx/conf.d/www_ports_stable.conf" \
		-n "${namespace}";
}

## sudo
#function create_secrets()
#{
#}


################################################################################
##	end of file							      ##
################################################################################
