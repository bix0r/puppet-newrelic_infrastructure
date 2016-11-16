require 'spec_helper'

describe 'newrelic_infrastructure::install' do
  it { should contain_package('newrelic-infra') }
end
