require "wave_int/version"

class WaveInt
  # Set WaveInt Range.
  def initialize(max, min=0)
    @max = max - min
    @cycle = @max * 2
    @offset = min
  end

  # Get WaveInt Value.
  def value(number)
    n = (number - @offset) % (@cycle)
    v = n > @max ? (@cycle) - n : n
    v + @offset
  end
end
