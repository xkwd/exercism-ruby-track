class Isogram
  def self.isogram?(str)
    chars = str.downcase.scan(/[a-z]/)
    chars == chars.uniq
  end
end
