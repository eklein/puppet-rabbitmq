# Define: rabbitmq::plugin
# Parameters:
# $ensure=present
# $url="www.rabbitmq.com/releases/plugins"
# $version="2.2.0"
# $target="/usr/lib/rabbitmq/lib/rabbitmq_server-version/plugins"
#
define rabbitmq::plugin ($ensure=present, $url="www.rabbitmq.com/releases/plugins", $version="2.2.0", $target="/usr/lib/rabbitmq/lib/rabbitmq_server-${version}/plugins") {
	common::archive::download { "${name}.ez":
		ensure     => $ensure,
		checksum   => false,
		url        => "http://${url}/v${version}/${name}-${version}.ez",
		src_target => $target,
		notify     => Class["rabbitmq::service"]
	}
}