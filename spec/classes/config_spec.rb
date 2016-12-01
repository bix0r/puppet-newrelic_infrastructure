require 'spec_helper'

describe 'newrelic_infrastructure::config' do
  context 'without a license key' do
    it { should raise_error(Puppet::ParseError, /License key cannot be empty/) }
  end

  context 'with a valid license key' do
    let(:params) do
      {:license_key => 'abc123'}
    end

    it { should contain_file('/etc/newrelic-infra.yml').with_content(/^license_key:\s/) }
  end

  context 'with non-integer verbose' do
    let(:params) do
      {
          :license_key => 'abc123',
          :verbose => true
      }
    end
    it { should raise_error(Puppet::ParseError, /validate_integer/) }
  end

  context 'with verbose' do
    let(:params) do
      {
          :license_key => 'abc123',
          :verbose => 1
      }
    end

    it { should contain_file('/etc/newrelic-infra.yml')
                    .with_content(/^license_key: abc123\nverbose: 1\n/)
    }
  end

  context 'with non-string display_name' do
    let(:params) do
      {
          :license_key => 'abc123',
          :display_name => true,
      }
    end
    it { should raise_error(Puppet::ParseError, /is not a string/) }
  end

  context 'with display_name' do
    let(:params) do
      {
          :license_key => 'abc123',
          :display_name => 'test123',
      }
    end

    it { should contain_file('/etc/newrelic-infra.yml')
                    .with_content(/^license_key: abc123\ndisplay_name: test123\n/)
    }
  end

  context 'with non-string proxy' do
    let(:params) do
      {
          :license_key => 'abc123',
          :proxy => true,
      }
    end
    it { should raise_error(Puppet::ParseError, /is not a string/) }
  end

  context 'with proxy' do
    let(:params) do
      {
          :license_key => 'abc123',
          :proxy => 'test123',
      }
    end

    it { should contain_file('/etc/newrelic-infra.yml')
                    .with_content(/^license_key: abc123\nproxy: test123\n/)
    }
  end

  context 'with non-string log_file' do
    let(:params) do
      {
          :license_key => 'abc123',
          :log_file => true,
      }
    end
    it { should raise_error(Puppet::ParseError, /is not a string/) }
  end

  context 'with log_file' do
    let(:params) do
      {
          :license_key => 'abc123',
          :log_file => 'test123',
      }
    end

    it { should contain_file('/etc/newrelic-infra.yml')
                    .with_content(/^license_key: abc123\nlog_file: test123\n/)
    }
  end

  context 'with non-hash custom_attributes' do
    let(:params) do
      {
          :license_key => 'abc123',
          :custom_attributes => true,
      }
    end
    it { should raise_error(Puppet::ParseError, /is not a Hash/) }
  end

  context 'with custom_attributes' do
    let(:params) do
      {
          :license_key => 'abc123',
          :custom_attributes => {
              'test_key1' => 'test1',
              'test_key2' => 'test2',
          }
      }
    end

    it { should contain_file('/etc/newrelic-infra.yml')
                    .with_content(/^license_key: abc123\ncustom_attributes:\n\s+test_key1: test1\n\s+test_key2: test2\n/)
    }
  end
end
