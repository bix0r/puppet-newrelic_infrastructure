class newrelic_infrastructure::install {
  # - get the gpg key
  # - add as an available source

  package { 'newrelic-infra':
    ensure => installed,
  }
}
