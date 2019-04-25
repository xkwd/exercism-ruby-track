class Scrabble
  LETTER_VALUES = {
    'AEIOULNRST': 1,
    'DG': 2,
    'BCMP': 3,
    'FHVWY': 4,
    'K': 5,
    'JX': 8,
    'QZ': 10
  }.freeze

  def initialize(word)
    @word = sanitize_input(word)
  end

  def self.score(word)
    new(word).score
  end

  def score
    return 0 if word.size.zero?

    calculate_score
  end

  private

  attr_reader :word

  def calculate_score
    word.upcase.split('').map do |letter|
      LETTER_VALUES.keys.each do |key|
        break LETTER_VALUES[key] if key.to_s.include?(letter)
      end
    end.reduce(:+)
  end

  def sanitize_input(input)
    input.to_s.strip
  end
end
