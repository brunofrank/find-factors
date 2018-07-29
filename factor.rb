require_relative './cache'
require 'benchmark'

class FindFactors
  def initialize(*arry)
    @arry = arry
    @factors = cache.find(arry)
  end

  def calculate
    return @factors unless @factors.nil?

    @factors = {}
    @arry.each do |item|
      @factors[item] = @arry.select { |a_item|  item % a_item == 0 && a_item != item }
    end
    cache.save(@arry, @factors)
    @factors
  end

  private

  def cache
    @cache ||= Cache.new
  end
end

puts Benchmark.measure { FindFactors.new(*(1..10_000).to_a).calculate }
#puts FindFactors.new(*(1..10_000).to_a).calculate


# No cache ->   5.520000   0.040000   5.560000 (  5.601927)
# With cache ->   0.010000   0.000000   0.010000 (  0.012519)
