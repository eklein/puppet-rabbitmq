# Class: rabbitmq::install
#
#
class rabbitmq::install {
	case $operatingsystem {
		/(?i)(Debian|Ubuntu)/: {
			include rabbitmq::install::debian
		}
		/(?i)(Redhat|CentOS)/: {
			include yum::repo::epel::main
			include rabbitmq::install::redhat
		}
		default: {
			fail "Unsupported OS ${operatingsystem} in 'rabbitmq' module"
		}
	}
}
