require 'redis'

module Abacus

  autoload :Counter, 'abacus/counter'

  extend self

  def method_missing(method, *args, &block)
    Abacus::Counter.new( method )
  end

  def redis
    $redis
  end
end
