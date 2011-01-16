# Class: rabbitmq::mcollective
#
#
class rabbitmq::mcollective {
	include rabbitmq
	
	rabbitmq::plugin { "amqp_client":
		ensure  => present,
		require => Class["rabbitmq::install::${rabbitmq::install_class}"]
	}
	
	rabbitmq::plugin { "rabbit_stomp":
		ensure  => present,
		require => Class["rabbitmq::install::${rabbitmq::install_class}"]
	}
	
	file { "/etc/rabbitmq/rabbitmq.conf":
		ensure  => present,
		source  => "puppet:///modules/rabbitmq/rabbitmq.conf",
		mode    => 644,
		notify  => Class["rabbitmq::service"],
		require => [ Class["rabbitmq::install::${rabbitmq::install_class}"], Rabbitmq::Plugin["amqp_client"], Rabbitmq::Plugin["rabbit_stomp"] ]
	}
}
