require "wave_int/version"

class WaveInt
  # Set WaveInt Range.
  def initialize(limit1, limit2=0)
    @min, @max = [limit1.to_i, limit2.to_i].sort
    @value = @min
  end

  # Get WaveInt Value.(default: return now value)
  def value(number = @value)
    n = (number.to_i - offset) % cycle
    offset + (n < wave_max ? n : cycle - n)
  end

  # Set WaveInt Value, and return WaveInt value.
  def set_value(number)
    @value = offset + (number.to_i - offset) % cycle
    value
  end

  # Get WaveInt next value.
  def add(number)
    set_value(@value + number.to_i)
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
