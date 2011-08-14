class rabbitmq::plugins::webmachine {
	rabbitmq::plugin { 'webmachine':
		ensure   => present,
		filename => 'webmachine-1.7.0-rmq2.5.0-hg0c4b60a.ez',
	}
}
