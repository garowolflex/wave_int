require 'spec_helper'

describe WaveInt do
  it 'has a version number' do
    expect(WaveInt::VERSION).not_to be nil
  end

  context 'when set default minimum' do
    it 'return wave value in the range' do
  	  max = 30
  	  wave1 = WaveInt.new(max)
      expect(wave1.value(0)).to be 0
      expect(wave1.value(max)).to be max
      expect(wave1.value(max + 1)).to be max - 1
      expect(wave1.value(max + max)).to be 0 # max - max
      expect(wave1.value(max + max + 1)).to be 1
    end
  end

  context 'when set positive minimum' do
    it 'return wave value in the range' do
      min = 10 
      max = min + 20
      wave1 = WaveInt.new(max, min)
      expect(wave1.value(min)).to be min
      expect(wave1.value(min + 1)).to be min + 1
      expect(wave1.value(max)).to be max
      expect(wave1.value(max + 1)).to be max - 1
      expect(wave1.value(max + (max - min))).to be min
      expect(wave1.value(max + (max - min) + 1)).to be min + 1
      expect(wave1.value(0)).to be min + min 
    end
  end

  context 'when set negative minimum' do
    it 'return wave value in the range' do
      max = 20
      min = -max
      wave1 = WaveInt.new(max, min)
      expect(wave1.value(min)).to be min
      expect(wave1.value(min + 1)).to be min + 1
      expect(wave1.value(max)).to be max
      expect(wave1.value(max + 1)).to be max - 1
      expect(wave1.value(max + (max - min))).to be min
      expect(wave1.value(max + (max - min) + 1)).to be min + 1
      expect(wave1.value(0)).to be 0
    end
  end
end
