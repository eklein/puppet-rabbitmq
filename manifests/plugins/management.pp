class rabbitmq::plugins::management{
    rabbitmq::plugin { "management":
	  ensure => present, 
	  suffix => "rabbitmq_management-2.5.0.ez"
    }
}
