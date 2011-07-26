module Abacus
  class Counter
    attr_reader :namespace

    def initialize( namespace )
      @namespace = namespace
    end

    def increment!( count, by = 1 )
      Abacus.redis.hincrby(redis_hash_key, count.to_s, by)
    end

    def decrement!( count, by = 1)
      increment!(count, -by)
    end

    def counts
      counts = Abacus.redis.hgetall(redis_hash_key)
      counts.each_pair do |key, count|
        counts[key] = count.to_i
      end

      counts
    end

    private

    def redis_hash_key
      "abacus:#{namespace}"
    end

  end
end
