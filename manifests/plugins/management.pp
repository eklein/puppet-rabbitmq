class rabbitmq::plugins::management {
	rabbitmq::plugin { 'management':
		ensure   => present, 
		filename => 'rabbitmq_management-2.5.0.ez',
	}
}
