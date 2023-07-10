########################################################################################################

SHELL=bash
NAME = zimbra-help
DESC = Package for getting help files installed for web client users.

########################################################################################################

all: zimbra-help-pkg

########################################################################################################

stage-help-files:
	mkdir -p build/stage/$(NAME)/opt/zimbra/jetty_base/webapps/zimbra/help/
	cp -r de build/stage/$(NAME)/opt/zimbra/jetty_base/webapps/zimbra/help/de
	cp -r en_US build/stage/$(NAME)/opt/zimbra/jetty_base/webapps/zimbra/help/en_US
	cp -r es build/stage/$(NAME)/opt/zimbra/jetty_base/webapps/zimbra/help/es
	cp -r fr build/stage/$(NAME)/opt/zimbra/jetty_base/webapps/zimbra/help/fr
	cp -r it build/stage/$(NAME)/opt/zimbra/jetty_base/webapps/zimbra/help/it
	cp -r ja build/stage/$(NAME)/opt/zimbra/jetty_base/webapps/zimbra/help/ja
	cp -r nl build/stage/$(NAME)/opt/zimbra/jetty_base/webapps/zimbra/help/nl
	cp -r pt_BR build/stage/$(NAME)/opt/zimbra/jetty_base/webapps/zimbra/help/pt_BR
	cp -r ru build/stage/$(NAME)/opt/zimbra/jetty_base/webapps/zimbra/help/ru
	cp -r zh_CN build/stage/$(NAME)/opt/zimbra/jetty_base/webapps/zimbra/help/zh_CN
	cp -r zh_HK build/stage/$(NAME)/opt/zimbra/jetty_base/webapps/zimbra/help/zh_HK

zimbra-help-pkg: stage-help-files
	../zm-pkg-tool/pkg-build.pl \
		--out-type=binary \
		--pkg-version=1.0.0 \
		--pkg-release=1 \
		--pkg-name=$(NAME) \
		--pkg-summary='$(DESC)' \
		--pkg-depends='zimbra-store (>= 8.8.15)' \
		--pkg-installs='/opt/zimbra/jetty_base/webapps/zimbra/help'

########################################################################################################