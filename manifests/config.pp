class newrelic_infrastructure::config(
  $license_key = ''
) {

  if ($license_key == '') {
    fail('License key cannot be empty.')
  }

  file { '/etc/newrelic-infra.yml':
    ensure  => file,
    content => template('newrelic_infrastructure/etc/newrelic-infra.yml.erb'),
  }
}
