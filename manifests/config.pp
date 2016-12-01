class newrelic_infrastructure::config(
  $license_key = '',
  $display_name = undef,
  $proxy = undef,
  $verbose = undef,
  $log_file = undef,
  $custom_attributes = undef,
) inherits newrelic_infrastructure {

  if ($license_key == '') {
    fail('License key cannot be empty.')
  }
  if ($verbose != undef) {
    validate_integer($verbose)
  }
  if ($display_name != undef) {
    validate_string($display_name)
  }
  if ($proxy != undef) {
    validate_string($proxy)
  }
  if ($log_file != undef) {
    validate_string($log_file)
  }
  if ($custom_attributes != undef) {
    validate_hash($custom_attributes)
  }

  $hash = delete_undef_values({
    license_key => $license_key,
    display_name => $display_name,
    proxy => $proxy,
    verbose => $verbose,
    log_file => $log_file,
    custom_attributes => $custom_attributes,
  })

  file { $newrelic_infrastructure::params::config_file:
    ensure  => file,
    content => inline_template('<%= @hash.to_yaml %><%= "\n" %>'),
    notify  => Service[$newrelic_infrastructure::params::service_name],
  }
}
