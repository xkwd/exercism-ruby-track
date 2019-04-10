class Matrix
  def initialize(matrix)
    @matrix = matrix
  end

  def rows
    @rows ||= matrix.split(/\n/).map { |row| row.split.map(&:to_i) }
  end

  def columns
    @columns ||= rows.transpose
  end

  private

  attr_reader :matrix
end
