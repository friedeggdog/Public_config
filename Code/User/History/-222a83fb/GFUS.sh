mkdir -p /var/www/gamma-z.hm/public_html
ln -s /home/HAD/mess.txt /var/www/gamma-z.hm/public_html/index.html
cp /etc/apache2/sites-available/000-default.conf /etc/apache2/sites-available/gamma-z.hm.conf
echo "<VirtualHost *:80>
ServerAdmin admin@example.com
ServerName gamma-z.hm
ServerAlias www.gamma-z.hm
DocumentRoot /var/www/gamma-z.hm/public_html
ErrorLog ${APACHE_LOG_DIR}/error.log
CustomLog ${APACHE_LOG_DIR}/access.log combined
</VirtualHost>" > /etc/apache2/sites-available/gamma-z.hm.conf
a2dissite 000-default.conf
a2ensite gamma-z.hm.conf