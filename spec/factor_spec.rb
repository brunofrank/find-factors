require_relative '../factor'

RSpec.describe FindFactors do
  let(:factor) { FindFactors.new(10, 5, 2, 20) }

  it "Calculates the factor of an array" do
    expected_factors = { 10 => [5, 2], 5 => [], 2 => [], 20 => [10,5,2] }
    expect(factor.calculate).to eq(expected_factors)
  end
end
