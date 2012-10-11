#!/bin/bash
# mysqli install scripts
# Author:wdlinux
# Url http://www.wdlinux.cn
if [ -d /root/lanmp/php-5.2.17/ext/mysqli ];then
	cd /root/lanmp/php-5.2.17/ext/mysqli
else
	cd /tmp
	wget -c http://dl.wdlinux.cn:5180/soft/php-5.2.17.tar.gz
	tar zxvf php-5.2.17.tar.gz
	cd php-5.2.17/ext/mysqli
fi
/www/wdlinux/php/bin/phpize
./configure --with-php-config=/www/wdlinux/php/bin/php-config
make
[ $? != 0 ] && exit
make install
echo 
grep 'no-debug-zts-20060613' /www/wdlinux/etc/php.ini
if [ $? != 0 ];then
        echo 'extension_dir=/www/wdlinux/php/lib/php/extensions/no-debug-zts-20060613' >> /www/wdlinux/etc/php.ini
fi
grep 'mysqli.so' /www/wdlinux/etc/php.ini
if [ $? != 0 ];then
	echo 'extension=mysqli.so' >> /www/wdlinux/etc/php.ini
fi
if [ -d /www/wdlinux/apache ];then
	service httpd restart
else
	service nginxd restart
fi
echo 
echo "mysqli install is OK"
echo
