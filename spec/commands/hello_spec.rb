require 'spec_helper'

describe "Fakerize Hello Command" do

  it "should return hello world" do
    Fakerize::Command.run('hello:world').should == "Hello World"
  end

  it "should return error on hello:foobar" do
    lambda { Fakerize::Command.run('hello:foobar') }.should raise_error
  end

end