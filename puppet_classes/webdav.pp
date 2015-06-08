exec {'yum update':
	command => '/bin/yum update'
	
 }

package {'httpd':
	ensure => installed, 
	
}

package {'httpd-tools':
	ensure => installed,

}
exec { 'Davdblock':
	command => '/bin/touch /var/lib/dav/lockdb'
    
}

exec { 'Davdblock1':
            command => '/bin/chown apache:apache /var/lib/dav/lockdb'
      
      }
file {['/var/www/iht/','/var/www/iht/dav']:
	ensure => 'directory',
	owner  => 'apache',
	group  => 'apache',
        mode   => '775'

}

exec { 'semanage fcontext' :
	command => '/usr/sbin/semanage fcontext -a -t httpd_sys_rw_content_t /var/www/iht/dav'
}

exec { 'restorecon' :
	command => '/usr/sbin/restorecon -v /var/www/iht/dav'
}

file { '/etc/httpd/conf.d/webdav.conf':
    content => template('/etc/puppet/manifests/webdav.conf.erb'),
    owner   => root,
    group   => root,
    mode    => 644,
}




service {'httpd':
	ensure => running,

}
