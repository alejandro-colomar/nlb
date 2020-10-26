################################################################################
##      Copyright (C) 2020        Alejandro Colomar Andrés                    ##
##      SPDX-License-Identifier:  GPL-2.0-only                                ##
################################################################################
##
## Switch ${stack_basename} public port to ${stability}
## ====================================================
##
################################################################################


################################################################################
##	source								      ##
################################################################################
source /usr/local/lib/libalx/sh/containers.sh;


################################################################################
##	definitions							      ##
################################################################################


################################################################################
##	functions							      ##
################################################################################
function update_nginx_symlink__()
{
	local	stack_basename="$1";
	local	stability="$2";


	ln -fsvT	"${stack_basename}_${stability}.conf"		\
			"etc/nginx/conf.d/${stack_basename}.conf";
}

## sudo
function stack_switch()
{
	local	mode="$1";
	local	stack_basename="$2";
	local	stability="$3";
	local	nlb_project="${NLB_PROJECT}";
	local	nlb_stack="${NLB_STACK}";

	update_nginx_symlink	"${stack_basename}" "${stability}";
	alx_stack_delete	"${mode}" "${nlb_stack}";
	alx_stack_deploy	"${mode}" "${nlb_project}" "${nlb_stack}";
}

################################################################################
##	end of file							      ##
################################################################################
