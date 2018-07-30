require_relative './cache'
require 'benchmark'

class FindFactors
  def initialize(*arry)
    @arry = arry
  end

  def calculate
    factors = cache.get(@arry)
    return factors unless factors.nil?

    factors = {}
    @arry.each do |item|
      factors[item] = @arry.select { |a_item|  item % a_item == 0 && a_item != item }
    end

    cache.store(@arry, factors)

    factors
  end

  private

  def cache
    @cache ||= Cache.new
  end
end


puts Benchmark.measure { FindFactors.new(*(1..10_000).to_a).calculate } if ARGV[0] ==  '--bench'
puts FindFactors.new(*(1..10_000).to_a).calculate if ARGV[0] ==  '--calculate'
