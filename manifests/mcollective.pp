# Class: rabbitmq::mcollective
#
#
class rabbitmq::mcollective {
	include rabbitmq
	include rabbitmq::plugins::amqp
	include rabbitmq::plugins::stomp
}
