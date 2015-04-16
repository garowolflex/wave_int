require "wave_int/version"

class WaveInt
  # Set WaveInt Range.
  def initialize(limit1, limit2=0)
    @min, @max = [limit1.to_i, limit2.to_i].sort
    @v = @min
  end

  # Get WaveInt Value.(default: return last value)
  def value(number = @v)
    n = (number.to_i - offset) % (cycle)
    @v = offset + (n < wave_max ? n : cycle - n)
    @v
  end

  private
  def offset
    @min
  end

  def wave_max
    @max - @min
  end

  def cycle
    wave_max * 2
  end
end
