# a Makefile to execute the scripts

fail2ban:
	bash fail2ban/fail2ban.sh

nextcloud:
	bash nextcloud/download.sh
	bash nextcloud/install.sh

clear:
	rm -rf nextcloud/nextcloud-20.0.0.zip

.PHONY: fail2ban nextcloud clear
