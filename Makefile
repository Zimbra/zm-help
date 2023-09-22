########################################################################################################

SHELL=bash
NAME = zimbra-help
DESC = Package for getting help files installed for web client users.

########################################################################################################

all: zimbra-help-pkg

########################################################################################################

stage-help-files:
	mkdir -p build/stage/$(NAME)/opt/zimbra/lib/$(NAME)/
	cp -r de build/stage/$(NAME)/opt/zimbra/lib/$(NAME)/de
	cp -r en_US build/stage/$(NAME)/opt/zimbra/lib/$(NAME)/en_US
	cp -r es build/stage/$(NAME)/opt/zimbra/lib/$(NAME)/es
	cp -r fr build/stage/$(NAME)/opt/zimbra/lib/$(NAME)/fr
	cp -r it build/stage/$(NAME)/opt/zimbra/lib/$(NAME)/it
	cp -r ja build/stage/$(NAME)/opt/zimbra/lib/$(NAME)/ja
	cp -r nl build/stage/$(NAME)/opt/zimbra/lib/$(NAME)/nl
	cp -r pt_BR build/stage/$(NAME)/opt/zimbra/lib/$(NAME)/pt_BR
	cp -r ru build/stage/$(NAME)/opt/zimbra/lib/$(NAME)/ru
	cp -r zh_CN build/stage/$(NAME)/opt/zimbra/lib/$(NAME)/zh_CN
	cp -r zh_HK build/stage/$(NAME)/opt/zimbra/lib/$(NAME)/zh_HK

zimbra-help-pkg: stage-help-files
	../zm-pkg-tool/pkg-build.pl \
		--out-type=binary \
		--pkg-version=1.0.0.$(shell git log --format=%at -1) \
		--pkg-release=1 \
		--pkg-name=$(NAME) \
		--pkg-summary='$(DESC)' \
		--pkg-pre-install-script='scripts/preinst.sh' \
		--pkg-post-install-script='scripts/postinst.sh' \
		--pkg-depends='zimbra-store (>= 8.8.15)' \
		--pkg-installs='/opt/zimbra/lib/$(NAME)'

########################################################################################################