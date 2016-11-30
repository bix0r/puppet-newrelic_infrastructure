require 'spec_helper'

describe 'newrelic_infrastructure::install' do
  let (:facts) do
    {
      :osfamily        => 'Debian',
      :operatingsystem => 'Ubuntu',
      :lsbdistrelease  => '14.04',
      :puppetversion   => Puppet.version,
      :lsbdistid       => 'Ubuntu',
      :lsbdistcodename => 'trusty',
      :architecture    => 'amd64',
    }
  end

  it { should contain_package('newrelic-infra') }

  it do
    should contain_apt__source('newrelic_infrastructure').with({
      :location => 'https://download.newrelic.com/infrastructure_agent/linux/apt',
      :repos    => 'main',
      :release  => 'trusty',
      :architecture => 'amd64',
      :key      => {
        'id'     => 'A758B3FBCD43BE8D123A3476BB29EE038ECCE87C',
        'source' => 'https://download.newrelic.com/infrastructure_agent/gpg/newrelic-infra.gpg'
      }})
  end
end
