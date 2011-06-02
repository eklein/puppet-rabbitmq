class rabbitmq::install::hosts {
    augeas { "localhost":
	  context => "/files/etc/hosts",
	   changes => [
		"set *[ipaddr = '127.0.0.1']/canonical localhost",
		"set *[ipaddr = '127.0.0.1']/alias[1] $hostname",
	   ],
    }
}
