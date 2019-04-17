class Clock
  attr_reader :hour, :minute

  def initialize(hour: 0, minute: 0)
    @hour = extract_hour(hour, minute)
    @minute = extract_minute(minute)
  end

  def to_s
    format_time(hour, minute)
  end

  def +(other)
    Clock.new(hour: hour + other.hour, minute: minute + other.minute)
  end

  def -(other)
    Clock.new(hour: hour - other.hour, minute: minute - other.minute)
  end

  def ==(other)
    to_s == other.to_s
  end

  private

  def extract_hour(hour, minute)
    (hour + minute / 60) % 24
  end

  def extract_minute(minute)
    minute % 60
  end

  def format_time(hour, minute)
    format('%02d:%02d', hour, minute)
  end
end
