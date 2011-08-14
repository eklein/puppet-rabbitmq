class rabbitmq::plugins::mochiweb {
	rabbitmq::plugin { 'mochiweb':
		ensure   => present,
		filename => 'mochiweb-1.3-rmq2.5.0-git9a53dbd.ez',
	}
}
