# Class: rabbitmq::service
#
#
class rabbitmq::service {

      # this patches init file to create a pid see http://tinyurl.com/6y2wkqq  
      file{"/etc/init.d/rabbitmq-server":
	   source => "puppet://puppet/modules/rabbitmq/rabbitmq-server",
	   require	=> Yum::Localinstall["rabbitmq-server"],
	   notify => Service["rabbitmq-server"]
      }

	service { "rabbitmq-server":
		ensure    => running,
		enable    => true,
		hasstatus => true,
		require   =>[Yum::Localinstall["rabbitmq-server"], Class["rabbitmq::config"],Class["rabbitmq::install::hosts"]]
	}
}
