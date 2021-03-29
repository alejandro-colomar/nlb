#!/usr/bin/make -f
########################################################################
# Copyright (C) 2021		Alejandro Colomar <alx.manpages@gmail.com>
# SPDX-License-Identifier:	GPL-2.0-only OR LGPL-2.0-only
########################################################################
SHELL	= /bin/bash


arch	= $(shell uname -m)

nginx	= $(CURDIR)/etc/docker/images/nginx
reg	= $(shell <$(nginx) grep '^reg' | cut -f2)
user	= $(shell <$(nginx) grep '^user' | cut -f2)
repo	= $(shell <$(nginx) grep '^repo' | cut -f2)
repository = $(reg)/$(user)/$(repo)
lbl	= $(shell <$(nginx) grep '^lbl' | cut -f2)
digest	= $(shell <$(nginx) grep '^digest' | grep $(arch) | cut -f3)

orchestrator = $(shell cat $(CURDIR)/etc/docker/orchestrator)
stack	= $(shell <$(CURDIR)/.config grep '^stack' | cut -f2)


.PHONY: digest
digest:
	@echo '	Update digest';
	@sed -i '\#$(repository)#s#$(lbl).*"$$#$(lbl)@$(digest)"#' \
		$(CURDIR)/etc/swarm/manifests/compose.yaml;

.PHONY: www-stable
.PHONY: www-test
www-stable www-test: www-%:
	ln -fsvT 'www_$*.conf' $(CURDIR)/etc/nginx/conf.d/www.conf;

.PHONY: stack-deploy
stack-deploy:
	@echo '	STACK deploy	$(orchestrator) $(stack)';
	@alx_stack_deploy -o '$(orchestrator)' '$(stack)';

.PHONY: stack-rm
stack-rm:
	@echo '	STACK rm	$(orchestrator) $(stack)';
	@alx_stack_delete -o '$(orchestrator)' '$(stack)';

.PHONY: stack-reboot
stack-reboot:
	@$(MAKE) stack-rm && $(MAKE) stack-deploy;
