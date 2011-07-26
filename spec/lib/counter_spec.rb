require 'spec_helper'

describe Abacus::Counter do

  before(:all) do 
    @counter = Abacus::Counter.new(:foo)
  end

  describe "#new" do
    it "should set the namespace" do
      @counter.namespace.should == :foo
    end
  end

  describe "#increment!" do
    it "should increment the counter" do
      Abacus.redis.should_receive(:hincrby).once.with("abacus:foo", "count1", 1).and_return(1)
      @counter.increment!(:count1)
    end
  end

  describe "#decrement!" do
    it "should decrement the counter" do
      Abacus.redis.should_receive(:hincrby).once.with("abacus:foo", "count1", -1).and_return(-1)
      @counter.decrement!(:count1)
    end
  end

  describe "#counts" do
    it "should fetch the counts" do
      Abacus.redis.should_receive(:hgetall).once.with("abacus:foo").and_return({"bar" => "10", "baz" => "-10"})
      @counter.counts.should == {"bar" => 10, "baz" => -10}
    end
  end
end
