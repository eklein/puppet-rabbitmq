# Class: rabbitmq::plugins::amqp
#
#
class rabbitmq::plugins::amqp {
	rabbitmq::plugin { "amqp_client":
		ensure => present
	}
}
