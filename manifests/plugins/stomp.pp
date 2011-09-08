# Class: rabbitmq::plugins::stomp
#
#
class rabbitmq::plugins::stomp {
	rabbitmq::plugin { 'rabbitmq_stomp':
		ensure => present,
		config => true,
	}
}
