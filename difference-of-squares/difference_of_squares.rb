class Squares
  def initialize(n)
    @range = (1..n)
  end

  def square_of_sum
    range.reduce(:+)**2
  end

  def sum_of_squares
    range.reduce { |acc, i| acc + i**2 }
  end

  def difference
    square_of_sum - sum_of_squares
  end

  private

  attr_reader :range
end
