class TwelveDays
  DAYS = %w[
    first
    second
    third
    fourth
    fifth
    sixth
    seventh
    eighth
    ninth
    tenth
    eleventh
    twelfth
  ].freeze

  GIFTS = [
    'a Partridge in a Pear Tree.',
    'two Turtle Doves',
    'three French Hens',
    'four Calling Birds',
    'five Gold Rings',
    'six Geese-a-Laying',
    'seven Swans-a-Swimming',
    'eight Maids-a-Milking',
    'nine Ladies Dancing',
    'ten Lords-a-Leaping',
    'eleven Pipers Piping',
    'twelve Drummers Drumming'
  ].freeze

  def self.song
    output = ''

    12.times do |i|
      output += "On the #{DAYS[i]} day of Christmas my true love gave to me: " \
                "#{gifts(i)}\n"
      output += "\n" if i < 11
    end

    output
  end

  def self.gifts(count)
    gifts = ''

    (count + 1).times do |i|
      gifts += GIFTS[count - i]
      gifts += ', ' if i < count - 1
      gifts += ', and ' if i >= 0 && i == count - 1
    end

    gifts
  end

  private_class_method :gifts
end
