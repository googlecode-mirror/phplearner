#!/bin/bash
# PDO_mysql install scripts
# Author:wdlinux
# Url http://www.wdlinux.cn

cd /tmp
wget -c http://pecl.php.net/get/PDO_MYSQL-1.0.2.tgz
tar zxvf PDO_MYSQL-1.0.2.tgz
cd PDO_MYSQL-1.0.2
/www/wdlinux/php/bin/phpize
./configure --with-php-config=/www/wdlinux/php/bin/php-config --with-pdo-mysql=/www/wdlinux/mysql
make
[ $? != 0 ] && exit
make install
echo 
grep 'no-debug-zts-20060613' /www/wdlinux/etc/php.ini
if [ $? != 0 ];then
        echo 'extension_dir=/www/wdlinux/php/lib/php/extensions/no-debug-zts-20060613' >> /www/wdlinux/etc/php.ini
fi
grep 'pdo_mysql.so' /www/wdlinux/etc/php.ini
if [ $? != 0 ];then
	echo 'extension=pdo_mysql.so' >> /www/wdlinux/etc/php.ini
fi
if [ -d /www/wdlinux/apache ];then
	service httpd restart
else
	service nginxd restart
fi
echo 
echo "pdo_mysql install is OK"
echo
