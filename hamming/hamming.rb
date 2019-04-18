class Hamming
  def self.compute(str1, str2)
    raise ArgumentError if str1.size != str2.size

    str1.split('').select.with_index { |v, i| v != str2[i] }.size
  end
end
