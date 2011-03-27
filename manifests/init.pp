# Class: rabbitmq
#
#
class rabbitmq {
	require rabbitmq::params
	
	include rabbitmq::install, rabbitmq::config, rabbitmq::service
}
