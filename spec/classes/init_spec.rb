require 'spec_helper'

describe 'newrelic_infrastructure' do
  it { should contain_class('newrelic_infrastructure') }
end
