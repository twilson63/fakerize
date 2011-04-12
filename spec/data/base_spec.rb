require 'spec_helper'

describe 'Fakerize::Data::Base' do
  subject { Fakerize::Data::Base.new() }

  it 'should return array of models' do
    subject.models.should == []
  end

  it 'should return an array of records for a given model' do
    subject.records(:foobar).should == []
  end


end
