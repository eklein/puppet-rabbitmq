class rabbitmq::plugins::management{
    rabbitmq::plugin { "management":
	  ensure => present
    }
}
