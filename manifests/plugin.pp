# Define: rabbitmq::plugin
# Parameters:
# $ensure=present
# $url="www.rabbitmq.com/releases/plugins"
# $target="/usr/lib/rabbitmq/lib/rabbitmq_server-version/plugins"
#
define rabbitmq::plugin ($ensure       = present,
												 $url          = 'www.rabbitmq.com/releases/plugins',
												 $target       = $rabbitmq::params::plugindir,
												 $config       = false,
												 $config_order = '20',
												 $filename     = '') {
	$remote_file = $filename ? {
		''      => "${name}-${rabbitmq::params::version}.ez",
		default => $filename,
	}

	common::archive::download { "${name}.ez":
		ensure     => $ensure,
		checksum   => false,
		url        => "http://${url}/v${rabbitmq::params::version}/$remote_file",
		src_target => $target,
		notify     => Class['rabbitmq::service'],
		require    => Class['rabbitmq::config']
	}
	
	if $config {
		concat::fragment { "rabbitmq.config-${name}":
			target  => "${rabbitmq::params::configdir}/rabbitmq.config",
			order   => $config_order,
			content => template("rabbitmq/plugins/rabbitmq.config.${name}.erb"),
		}
	}
}
