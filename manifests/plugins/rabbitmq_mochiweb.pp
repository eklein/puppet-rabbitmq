class rabbitmq::plugins::rabbitmq_mochiweb {
	rabbitmq::plugin { 'rabbitmq_mochiweb':
		ensure => present,
	}
}
