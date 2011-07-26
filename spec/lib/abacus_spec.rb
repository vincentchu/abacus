require 'spec_helper'

describe Abacus do
  it "should return an instance of Abacus::Counter when passed something it doesn't know" do
    counter = Abacus.random_counter

    counter.should be_an_instance_of( Abacus::Counter )
    counter.namespace.should == :random_counter
  end
end
