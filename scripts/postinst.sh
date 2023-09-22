if [ -d /opt/zimbra/jetty_base/webapps/zimbra ]; then
    mkdir -p /opt/zimbra/jetty_base/webapps/zimbra/help
    cp -r /opt/zimbra/lib/zimbra-help/* /opt/zimbra/jetty_base/webapps/zimbra/help/
    rm -rf /opt/zimbra/lib/zimbra-help
fi
echo "**** Completed zimbra-help package installation ****"