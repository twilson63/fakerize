require 'spec_helper'

describe 'Config Module' do
  before(:all) do
    File.open('test_config.yml', 'w') do |f|
      f.write fakerize_config.to_yaml
    end

    File.open('bad_test_config.yml', 'w') do |f|
      f.write "{ FOO => BAR }"
    end


  end

  let(:fakerize_config) do
    {
      :models => [{
        :name => :patients,
        :options => [{
          :field => :first_name,
          :fakerize => "Faker::Name.first_name"
        }]
      }]
    }
  end

  context 'success' do
    subject { Fakerize::Config.load('test_config.yml') }

    it 'should load config and return hash' do
      subject.should == fakerize_config
    end

    it { subject[:models].length.should == 1 }
  end

  context 'failure' do

    it 'should not load invalid config' do
      lambda { Fakerize::Config.load('bad_test_config.yml') }.should raise_error
    end
  end

  after(:all) do
    File.delete('test_config.yml')
    File.delete('bad_test_config.yml')

  end

end
