# Class: rabbitmq::config
#
#
class rabbitmq::config {
	file { $rabbitmq::params::configdir:
		ensure => directory,
		owner  => root,
		group  => root,
		mode   => 755
	}
	
	# Setup concat module
	include concat::setup
	
	# Setup node config file for concat module and include first and last fragments
	concat { "${rabbitmq::params::configdir}/rabbitmq.config":
		owner   => root,
		group   => root,
		mode    => 644,
		require => Class["rabbitmq::install"], 
	}
	
	concat::fragment { "rabbitmq.config-start":
		target  => "${rabbitmq::params::configdir}/rabbitmq.config",
		order   => 10,
		content => template("rabbitmq/rabbitmq.config.start.erb")
	}
	
	concat::fragment { "rabbitmq.config-end":
		target  => "${rabbitmq::params::configdir}/rabbitmq.config",
		order   => 90,
		content => template("rabbitmq/rabbitmq.config.end.erb")
	}
}
