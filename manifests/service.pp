# Class: rabbitmq::service
#
#
class rabbitmq::service {
<<<<<<< HEAD
	service { 'rabbitmq-server':
=======

      # this patches init file to create a pid see http://tinyurl.com/6y2wkqq  
      file{"/etc/init.d/rabbitmq-server":
	   source => "puppet://puppet/modules/rabbitmq/rabbitmq-server",
	   require	=> Yum::Localinstall["rabbitmq-server"],
	   notify => Service["rabbitmq-server"]
      }

	service { "rabbitmq-server":
>>>>>>> patching init file to include pid file creation
		ensure    => running,
		enable    => true,
		hasstatus => true,
		require   => Class['rabbitmq::config'],
	}
}
