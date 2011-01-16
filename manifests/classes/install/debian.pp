# Class: rabbitmq::install::debian
#
#
class rabbitmq::install::debian {
	package { "rabbitmq-server":
		ensure  => latest
	}
}
