# Define: rabbitmq::user
# Parameters:
# $ensure = present,
# $password = false,
# $vhost = '/',
# $conf = '.*',
# $read = '.*',
# $write = '.*'
#
define rabbitmq::user ($ensure   = present,
											 $password = false,
											 $vhost    = '/',
											 $conf     = '.*',
											 $read     = '.*',
											 $write    = '.*') {

	require rabbitmq

	case $ensure {
		present: {
			if ! $password {
				fail 'Must pass password to rabbitmq::user'
			}
			exec{ "rabbitmqctl-user-${name}":
				command => "rabbitmqctl add_user '${name}' '${password}'",
				onlyif  => "test `rabbitmqctl -q list_users | grep  '^${name}\t' | wc -l` -eq 0",
			}
		}
		absent: {
			exec{ "rabbitmqctl-user-${name}":
				command => "rabbitmqctl delete_user '${name}'",
				onlyif  => "test `rabbitmqctl -q list_users | grep '^${name}\t' | wc -l` -gt 0",
			}
		}
	}

	rabbitmq::permissions { $name:
		ensure => $ensure,
		vhost  => $vhost,
		conf   => $conf,
		read   => $read,
		write  => $write,
	}
}
