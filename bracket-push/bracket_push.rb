class Brackets
  BRACKETS = { '(' => ')', '[' => ']', '{' => '}' }.freeze

  def self.paired?(str)
    stack = []

    str.each_char do |bracket|
      case bracket
      when '(', '[', '{'
        stack << bracket
      when ')', ']', '}'
        return false if stack.pop != BRACKETS.key(bracket)
      end
    end

    stack.empty?
  end
end
