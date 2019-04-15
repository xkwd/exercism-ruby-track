class Luhn
  def initialize(number)
    @number = sanitize_input(number)
  end

  def self.valid?(number)
    new(number).valid?
  end

  def valid?
    return false if number.size <= 1 || number.scan(/\D/).any?

    (checksum % 10).zero?
  end

  private

  attr_reader :number

  def checksum
    number.split('').reverse.map(&:to_i).each_with_index.reduce(0) do |acc, (v, i)|
      acc + (i.odd? ? luhn_double(v) : v)
    end
  end

  def luhn_double(digit)
    digit > 4 ? digit * 2 - 9 : digit * 2
  end

  def sanitize_input(input)
    input.delete(' ')
  end
end
