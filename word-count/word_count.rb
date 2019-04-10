class Phrase
  def initialize(phrase)
    @phrase = phrase
  end

  def word_count
    phrase.downcase.scan(/\b[\w']*\w/).each_with_object(Hash.new(0)) do |v, h|
      h[v] += 1
    end
  end

  private

  attr_reader :phrase
end
