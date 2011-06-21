class rabbitmq::plugins::management_agent {
    rabbitmq::plugin { "management_agent":
	  ensure => present, 
	  suffix => "rabbitmq_management_agent-2.5.0.ez"
    }
}
