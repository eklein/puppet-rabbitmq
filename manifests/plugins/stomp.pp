# Class: rabbitmq::plugins::stomp
#
#
class rabbitmq::plugins::stomp {
	rabbitmq::plugin { 'rabbit_stomp':
		ensure => present,
		config => true,
	}
}
