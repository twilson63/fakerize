require 'spec_helper'

describe "Fakerize Convert Command" do

  it "should return db connect string" do
    Fakerize::Config.should_receive(:load).and_return(:models => [{:name => 'foo', :options => [{:field => :bar, :fakerize => 'Name.first_name'}]}])
    Fakerize::Data::Sequel.should_receive(:new).and_return(mock('data', :records => [{:id => 1, :bar => 'foo'}], :update => true))
    Fakerize::Process.should_receive(:run).and_return({:id => 1, :bar => 'Tim'})
  
    Fakerize::Command.run('database:convert', ["sqlite://world.db", "options.yml"]).should == true

  end

  it "should return error on hello:foobar" do
    lambda { Fakerize::Command.run('database:convert foobar') }.should raise_error
  end

end
