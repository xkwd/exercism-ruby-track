class Gigasecond
  GIGASECOND = 1_000_000_000

  def self.from(birth_time)
    birth_time + GIGASECOND
  end
end
