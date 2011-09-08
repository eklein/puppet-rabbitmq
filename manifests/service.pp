# Class: rabbitmq::service
#
#
class rabbitmq::service {
  service { 'rabbitmq-server':
    # this patches init file to create a pid see http://tinyurl.com/6y2wkqq  
    file{"/etc/init.d/rabbitmq-server":
    source => "puppet://puppet/modules/rabbitmq/rabbitmq-server",
    require => Package["rabbitmq-server"],
    notify => Service["rabbitmq-server"]
  }

  service { "rabbitmq-server":
    ensure    => running,
    enable    => true,
    hasstatus => true,
    require   => Class['rabbitmq::config'],
  }
}
