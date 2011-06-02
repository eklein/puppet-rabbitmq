# Class: rabbitmq::service
#
#
class rabbitmq::service {


	service { "rabbitmq-server":
		ensure    => running,
		enable    => true,
		hasstatus => true,
		require   =>[Yum::Localinstall["rabbitmq-server"], Class["rabbitmq::config"]]
	}
}
