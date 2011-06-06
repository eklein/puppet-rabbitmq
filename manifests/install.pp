# Class: rabbitmq::install
#
#
class rabbitmq::install {

      include rabbitmq::install::hosts 

	case $operatingsystem {
		/(?i)(Debian|Ubuntu)/: {
			include rabbitmq::install::debian
		}
		/(?i)Redhat/: {
			include rabbitmq::install::redhat
		}
		/(?i)CentOS/: {
			include rabbitmq::install::centos
		}
		default: {
			fail "Unsupported OS ${operatingsystem} in 'rabbitmq' module"
		}
	}
}
