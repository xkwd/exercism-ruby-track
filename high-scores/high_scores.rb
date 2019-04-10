class HighScores
  PERSONAL_TOP_QUANTITY = 3
  attr_reader :scores

  def initialize(scores)
    @scores = scores
  end

  def latest
    scores.last
  end

  def personal_best(quantity = nil)
    quantity.nil? ? scores.max : scores.max(quantity)
  end

  def personal_top_three
    personal_best(PERSONAL_TOP_QUANTITY)
  end
end
