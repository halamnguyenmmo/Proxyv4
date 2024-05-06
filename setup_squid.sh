yum install -y squid && chkconfig squid on && service squid start && sed -i 's/http_access deny all/http_access allow all/' /etc/squid/squid.conf && yum install -y httpd-tools && touch /etc/squid/squid_passwd && chown squid /etc/squid/squid_passwd && sed -i '1i\auth_param basic program /usr/lib64/squid/basic_ncsa_auth /etc/squid/squid_passwd\nauth_param basic children 5\nauth_param basic realm Squid proxy-caching web server\nauth_param basic credentialsttl 2 hours\nauth_param basic casesensitive off\nacl ncsa_users proxy_auth REQUIRED\nhttp_access allow ncsa_users' /etc/squid/squid.conf && cat <<EOF >> /etc/squid/squid.conf
via off
forwarded_for off
request_header_access Allow allow all
request_header_access Authorization allow all
request_header_access WWW-Authenticate allow all
request_header_access Proxy-Authorization allow all
request_header_access Proxy-Authenticate allow all
request_header_access Cache-Control allow all
request_header_access Content-Encoding allow all
request_header_access Content-Length allow all
request_header_access Content-Type allow all
request_header_access Date allow all
request_header_access Expires allow all
request_header_access Host allow all
request_header_access If-Modified-Since allow all
request_header_access Last-Modified allow all
request_header_access Location allow all
request_header_access Pragma allow all
request_header_access Accept allow all
request_header_access Accept-Charset allow all
request_header_access Accept-Encoding allow all
request_header_access Accept-Language allow all
request_header_access Content-Language allow all
request_header_access Mime-Version allow all
request_header_access Retry-After allow all
request_header_access Title allow all
request_header_access Connection allow all
request_header_access Proxy-Connection allow all
request_header_access User-Agent allow all
request_header_access Cookie allow all
request_header_access All deny all
EOF
service squid restart
