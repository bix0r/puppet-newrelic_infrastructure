require 'spec_helper'

describe 'newrelic_infrastructure::config' do
  context 'without a license key' do
    it { should raise_error(Puppet::ParseError, /License key cannot be empty/) }
  end

  context 'with a valid license key' do
    let(:params) do
      { :license_key => 'abc123' }
    end

    it { should contain_file('/etc/newrelic-infra.yml').with_content(/^license_key:\s/) }
  end
end
