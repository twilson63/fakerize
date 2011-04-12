require 'spec_helper'

describe "Fakerize Command" do

  it "should return hello world" do
    Fakerize::Command.run('hello:world').should == "Hello World"
  end

  it "should return error on hello:foobar" do
    lambda { Fakerize::Command.run('hello:foobar') }.should raise_error
  end

  # it "should return status of instance" do
  #   Proviso::Command.run('ec2:status',['i-3d8b0157'])
  # end
  #
  # it "should link server " do
  #   Proviso::Command.run('zerigo:link',['staging.example.com','127.0.0.1'])
  #
  # end

end
