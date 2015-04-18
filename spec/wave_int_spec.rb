require 'spec_helper'

describe WaveInt do
  it 'has a version number' do
    expect(WaveInt::VERSION).not_to be nil
  end

  describe 'WaveInt#initialize' do
    it 'order of parameters are redundant' do
      min = -99
      max = 99
      wave1 = WaveInt.new(min, max)
      wave2 = WaveInt.new(max, min)
      [-32768, 0, 32767].each do |v|
        expect(wave2.value(v)).to be wave1.value(v)
      end
    end

    it 'parameter2 default is 0' do
      [-100, 100].each do |lim|
        wave = WaveInt.new(lim, 0)
        wave_omitted = WaveInt.new(lim)
        sample = 16777216
        expect(wave_omitted.value(sample)).to be wave.value(sample)
      end
    end
  end

  describe 'WaveInt#value' do
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
        expect(wave1.value(min - 1)).to be min + 1
      end
    end
  end

  describe 'WaveInt#add' do
    it 'increase by specified number, and return increased value' do
      max = 10
      step_val = 3
      wave = WaveInt.new(max)
      expect(wave.add(step_val)).to be step_val
      expect(wave.add(max - step_val)).to be max
      expect(wave.add(step_val)).to be max - step_val
      expect(wave.add(-step_val)).to be max
    end
  end

  describe 'WaveInt controll value in the Range' do
    it '#set_value return specified number in the Range, and move basepoint' do
      min = -100
      max = 100
      wave = WaveInt.new(min, max)
      expect(wave.set_value(min - 1)).to be min + 1
      expect(wave.add(1)).to be min
      expect(wave.add(1)).to be min + 1
      expect(wave.set_value(max)).to be max
      expect(wave.add(10)).to be max - 10
    end

    it '#value return last value when omit parameter' do
      wave = WaveInt.new(10)
      [3, 13, 235, -230].each do |v|
        last = wave.add(v)
        expect(wave.value).to be last
      end
    end
  end
end
