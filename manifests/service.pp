class newrelic_infrastructure::service inherits newrelic_infrastructure {
  service { $newrelic_infrastructure::params::service_name:
    ensure    => running,
    start     => '/sbin/initctl start newrelic-infra',
    stop      => '/sbin/initctl stop newrelic-infra',
    hasstatus => false,
  }
}