class newrelic_infrastructure::config(
  $license_key = ''
) {

  file { '/etc/newrelic-infra.yml':
    ensure  => file,
    content => template('newrelic_infrastructure/etc/newrelic-infra.yml.erb'),
  }
}
