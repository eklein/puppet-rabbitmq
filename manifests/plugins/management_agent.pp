class rabbitmq::plugins::management_agent {
    rabbitmq::plugin { "management_agent":
	  ensure => present
    }
}
