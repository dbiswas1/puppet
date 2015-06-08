# puppet
puppet recipe's
Setting up WEBDAV in Centos 7 with APACHE 2.4

have undergone few difficulties in setting it up, so might help some one whoever is trying to set up the similar thing

most important thing  is selinux not allowing the httpd process to write in DAV directory so have those commads mentioned here


<tr>
<td>https://bugzilla.redhat.com/show_bug.cgi?id=883129</td>
</tr>
https://code.google.com/p/rudix/downloads/detail?name=cadaver-0.23.3-1.dmg&can=2&q=label%3ARudix-2011
https://www.howtoforge.com/how-to-set-up-webdav-with-apache2-on-centos-5.5
https://www.digitalocean.com/community/questions/setup-webdav-with-nginx-on-ubuntu-12-04   WbDav
https://www.digitalocean.com/community/tutorials/how-to-configure-webdav-access-with-apache-on-ubuntu-12-04    WebDav



DavLockDB /var/lib/dav/lockdb
NameVirtualHost *:80








