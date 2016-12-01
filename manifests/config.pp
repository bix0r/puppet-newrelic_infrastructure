class newrelic_infrastructure::config(
  $license_key = '',
  $display_name = undef,
  $proxy = undef,
  $verbose = undef,
  $log_file = undef,
  $custom_attributes = undef,
) {

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

  $hash = {
    license_key => $license_key,
    display_name => $display_name,
    proxy => $proxy,
    verbose => $verbose,
    log_file => $log_file,
    custom_attributes => $custom_attributes,
  }

  file { '/etc/newrelic-infra.yml':
    ensure  => file,
    # not sure why "compact" is not available here, so using select
    content => inline_template('<%= @hash.select{|_, value| !value.nil?}.to_yaml %>'),
  }
}
