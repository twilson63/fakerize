require 'spec_helper'

describe 'Fakerize::Process' do
  before do
    Faker::Name.stub(:first_name).and_return('Jimmy')
  end

  let(:data) do
    { :last_name => 'Rocket', :first_name => 'Johnny' }
  end

  let(:fakerize_options) do
    [{ :field => :first_name, :fakerize => 'Faker::Name.first_name' }]
  end

  it 'should fakerize attributes' do
    Fakerize::Process.run(data, fakerize_options)[:first_name].should == 'Jimmy'
  end

  it 'should not fakerize if options are invalid' do
    fakerize_options = [{ :field => 'foobar', :fakerize => 'Faker::Foo.bar' }]
    lambda { Fakerize::Process.run(data, fakerize_options) }.should raise_error
  end



end