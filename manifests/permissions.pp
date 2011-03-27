# Define: rabbitmq::permissions
# Parameters:
# arguments
#
define rabbitmq::permissions ($ensure = present, $vhost = '/', $conf = '.*', $read = '.*', $write = '.*') {
	require rabbitmq

	case $ensure {
		present: {
			exec{ "rabbitmqctl-permissions-$name":
				command => "rabbitmqctl set_permissions -p '$vhost' '$name' '$conf' '$write' '$read'",
				onlyif  => "test `rabbitmqctl -q list_permissions -p '$vhost' | grep '^$name\t$conf\t$write\t$read' | wc -l` -eq 0",
			}
		}
		absent: {
			exec{ "rabbitmqctl-permissions-$name":
				command => "rabbitmqctl clear_permissions -p '$vhost' '$name'",
				onlyif  => "test `rabbitmqctl -q list_permissions -p '$vhost' | grep '^$name\t$conf\t$write\t$read ' | wc -l` -gt 0",
			}
		}
	}
}