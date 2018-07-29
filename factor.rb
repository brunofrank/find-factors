class FindFactors
  def initialize(*arry)
    @arry = arry
  end

  def calculate
    factors = {}
    @arry.each do |item|
      factors[item] = @arry.select { |a_item|  item % a_item == 0 && a_item != item }
    end

    factors
  end
end


puts FindFactors.new(10, 5, 2, 20).calculate
