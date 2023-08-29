#!/bin/bash
wget https://ko.wordpress.org/wordpress-5.7.8-ko_KR.tar.gz
tar xvfz wordpress-5.7.8-ko_KR.tar.gz
yum install -y httpd
cp -r wordpress/* /var/www/html/
amazon-linux-extras enable php8.0 
yum install -y php php-pdo php-fpm php-json php-mysqlnd
cp /var/www/html/{wp-config-sample.php,wp-config.php}
sed -i 's/DirectoryIndex index.html/DirectoryIndex index.php/g' /etc/httpd/conf/httpd.conf
sed -i 's/database_name_here/wordpress/g' /var/www/html/wp-config.php
sed -i 's/username_here/root/g' /var/www/html/wp-config.php
sed -i 's/password_here/It12345!/g' /var/www/html/wp-config.php
sed -i 's/localhost/mydb.cfrxjqazpmhs.ap-northeast-2.rds.amazonaws.com/g' /var/www/html/wp-config.php
echo "Hello LoadBalancer" > /var/www/html/health.html
systemctl enable --now httpd