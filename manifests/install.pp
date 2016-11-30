class newrelic_infrastructure::install inherits newrelic_infrastructure{
  include apt

  apt::source { 'newrelic_infrastructure':
    location     => 'https://download.newrelic.com/infrastructure_agent/linux/apt',
    repos        => 'main',
    release      => $::lsbdistcodename,
    architecture => $::architecture,
    key          => {
      'id'     => 'A758B3FBCD43BE8D123A3476BB29EE038ECCE87C',
      'source' => 'https://download.newrelic.com/infrastructure_agent/gpg/newrelic-infra.gpg'
    }
  }

  package { $newrelic_infrastructure::params::package_name:
    ensure  => installed,
    require => Apt::Source['newrelic_infrastructure'],
  }
}
