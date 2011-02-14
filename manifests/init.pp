import "classes/*.pp"
import "classes/install/*.pp"
import "classes/plugins/*.pp"
import "definitions/*.pp"

# Class: rabbitmq
#
#
class rabbitmq {
	require rabbitmq::params
	
	include rabbitmq::install, rabbitmq::config, rabbitmq::service
}
