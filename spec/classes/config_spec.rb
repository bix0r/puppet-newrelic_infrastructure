require 'spec_helper'

describe 'newrelic_infrastructure::config' do
  it do
    should contain_file('/etc/newrelic-infra.yml').with_content(/^license_key:\s/)
  end
end
