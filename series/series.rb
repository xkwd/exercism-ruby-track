class Series
  def initialize(series)
    @series = series
  end

  def slices(slice_length)
    raise ArgumentError if slice_length > series.length

    series.scan(/(?=(\d{#{slice_length}}))/).flatten
  end

  private

  attr_reader :series
end
