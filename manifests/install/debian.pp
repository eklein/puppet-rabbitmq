# Class: rabbitmq::install::debian
#
#
class rabbitmq::install::debian {
	include apt::repo::rabbitmq::main
	
	package { "rabbitmq-server":
		ensure  => latest,
		require => Class["apt::repo::rabbitmq::main"]
	}
}
