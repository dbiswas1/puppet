# puppet
puppet recipe's
Setting up WEBDAV in Centos 7 with APACHE 2.4

have undergone few difficulties in setting it up, so might help some one whoever is trying to set up the similar thing

most important thing  is selinux not allowing the httpd process to write in DAV directory so have those commads mentioned here


<tr>
<td>https://bugzilla.redhat.com/show_bug.cgi?id=883129</td>
</tr>


\<VirtualHost *:80\>
        ServerAdmin webmaster@localhost

        DocumentRoot /var/www/iht/dav/
        <Directory /var/www/iht/dav/>
                Options Indexes MultiViews
                AllowOverride None
                Order allow,deny
                allow from all
        </Directory>

        Alias /webdav /var/www/iht/dav

        <Location /webdav>
           DAV On
           AuthType Basic
           AuthName "webdav"
           AuthUserFile /var/www/iht/passwd.dav
           Require valid-user
       </Location>

\</VirtualHost\>

Chown -R apache:apache  /var/www
Chmod -R 775 /var/www

Chown -R apache:apache  /var/lib/dav
Chmod -R 775  /var/lib/dav

htpasswd -c  /var/www/iht/passwd.dav <username>
htpasswd   /var/www/iht/passwd.dav <username>   (without C option for subsequent users)

semanage fcontext -a -t httpd_sys_rw_content_t  /var/lib/dav
restorecon -v  /var/lib/dav

semanage fcontext -a -t httpd_sys_rw_content_t   /var/www/iht/dav
restorecon -v   /var/www/iht/dav


DavLockDB /var/lib/dav/lockdb
NameVirtualHost *:80








