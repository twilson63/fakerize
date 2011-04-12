require 'spec_helper'

describe 'Fakerize::Data::Sequel' do
  before do
    Sequel.stub(:connect).and_return(mock('hello', :tables => [:hello], :[] => mock('results', :all => [{:world => 'awesome'}])  ))
  end

  subject { Fakerize::Data::Sequel.new("sqlite://test.db") }

  it 'should return array of models' do
    subject.models.should == [:hello]
  end

  it 'should return an array of records for a given model' do
    subject.records(:hello).length.should == 1
  end


end
