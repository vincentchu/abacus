require 'redis'

module Abacus

  autoload :Counter, 'abacus/counter'

  extend self

  


  def redis
    $redis
  end
end
