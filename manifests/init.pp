# Class: rabbitmq
#
#
class rabbitmq {
	require rabbitmq::params
	
	include rabbitmq::install, rabbitmq::config, rabbitmq::service
	include rabbitmq::plugins::webmachine, rabbitmq::plugins::mochiweb
	include rabbitmq::plugins::amqp, rabbitmq::plugins::rabbitmq_mochiweb
	include rabbitmq::plugins::amqp, rabbitmq::plugins::rabbitmq_mochiweb
	include rabbitmq::plugins::management_agent, rabbitmq::plugins::management
}
