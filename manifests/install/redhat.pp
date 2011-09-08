# Class: rabbitmq::install::redhat
#
#
class rabbitmq::install::redhat {
	# Fetch the updated RPM from rabbitmq.com
	common::archive::download { "rabbitmq-server-${rabbitmq::params::version}-1.noarch.rpm":
		ensure   => present,
		checksum => false,
		url      => "http://www.rabbitmq.com/releases/rabbitmq-server/v${rabbitmq::params::version}/rabbitmq-server-${rabbitmq::params::version}-1.noarch.rpm",
	}
	
	# Fetch the GPG key only if we don't have it
	exec { 'fetch-rabbitmq-gpg-key':
		command => '/usr/bin/wget -q http://www.rabbitmq.com/rabbitmq-signing-key-public.asc',
		cwd     => '/tmp',
		unless  => '/bin/rpm -qi gpg-pubkey-* | /bin/grep RabbitMQ',
		notify  => Exec['import-rabbitmq-gpg-key'],
	}
	
	exec { 'import-rabbitmq-gpg-key':
		command     => '/bin/rpm --import /tmp/rabbitmq-signing-key-public.asc',
		cwd         => '/tmp',
		refreshonly => true,
		require     => Exec['fetch-rabbitmq-gpg-key'],
	}
	
	# Tell yum to install the downloaded file
	yum::localinstall { 'rabbitmq-server':
		file     => "/usr/src/rabbitmq-server-${rabbitmq::params::version}-1.noarch.rpm",
<<<<<<< HEAD
		provides => 'rabbitmq-server',
		require  => [ Common::Archive::Download["rabbitmq-server-${rabbitmq::params::version}-1.noarch.rpm"], Exec['import-rabbitmq-gpg-key'], Class['yum::repo::epel::main'] ],
=======
		provides => "rabbitmq-server",
		require  => [ Common::Archive::Download["rabbitmq-server-${rabbitmq::params::version}-1.noarch.rpm"], Exec["import-rabbitmq-gpg-key"],Class["epel"] ]
>>>>>>> patching init file to include pid file creation
	}
}
