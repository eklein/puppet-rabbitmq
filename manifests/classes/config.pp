# Class: rabbitmq::config
#
#
class rabbitmq::config {
	File {
		require => Class["rabbitmq::install::${rabbitmq::install_class}"],
		notify  => Class["rabbitmq::service"],
		owner   => root,
		group   => root
	}
}
