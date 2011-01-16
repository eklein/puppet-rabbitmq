import "classes/*.pp"
import "classes/install/*.pp"
import "definitions/*.pp"

# Class: rabbitmq
#
#
class rabbitmq {
	if ( ! $rabbitmq_version ) { $rabbitmq_version = "2.2.0" }
	
	case $operatingsystem {
		/(?i)(Debian|Ubuntu)/: {
			$install_class = "debian"
		}
		/(?i)(Redhat|CentOS)/: {
			$install_class = "redhat"
		}
		default: {
			fail "Unsupported OS ${operatingsystem} in 'rabbitmq' module"
		}
	}
	
	include "rabbitmq::install::${install_class}", rabbitmq::config, rabbitmq::service
}
