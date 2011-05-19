# Class: rabbitmq::params
#
#
class rabbitmq::params {
	$version = $rabbitmq_version ? {
		'' => '2.4.0',
		default => $rabbitmq_version,
	}
	
	$configdir = $rabbitmq_configdir ? {
		''      => '/etc/rabbitmq',
		default => $rabbitmq_configdir,
	}
	
	$plugindir = $rabbitmq_plugindir ? {
		''      => "/usr/lib/rabbitmq/lib/rabbitmq_server-${version}/plugins",
		default => $rabbitmq_plugindir,
	}
	
	# Plugins
	# Stomp
	$stomp_ipv4_address = $rabbitmq_stomp_ipv4_address ? {
		''      => '127.0.0.1',
		default => $rabbitmq_stomp_ipv4_address,
	}
	
	$stomp_ipv4_port = $rabbitmq_stomp_ipv4_port ? {
		''      => '61613',
		default => $rabbitmq_stomp_ipv4_port,
	}
	
	$stomp_ipv6_address = $rabbitmq_stomp_ipv6_address ? {
		''      => '::1',
		default => $rabbitmq_stomp_ipv6_address,
	}
	
	$stomp_ipv6_port = $rabbitmq_stomp_ipv6_port ? {
		''      => '61613',
		default => $rabbitmq_stomp_ipv6_port,
	}
}
