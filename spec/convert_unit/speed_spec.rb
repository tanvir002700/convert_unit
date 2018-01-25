module ConvertUnit
  RSpec.describe Speed, type: :class do
    context 'initiate object with wrong unit type argument' do
      it 'raise a TypeError' do
        expect { Speed.new(1, 2) }.to raise_error(TypeError, 'Invalid Unit Type')
      end
    end

    context 'initiate object with worng unit argument' do
      it 'raise a TypeError' do
        expect { Speed.new(1, 'degre') }.to raise_error(TypeError, 'Invalid Unit Type')
      end
    end

    context 'initiate object with wrong value' do
      it 'raise a TypeError' do
        expect { Speed.new('abc', 'cm2') }.to raise_error(TypeError)
      end
    end

    context 'initiate object with valid value' do
      it 'not raise any error' do
        expect { Speed.new(1, 'm/s') }.to_not raise_error
      end
    end

    context 'initiate object with short form of unit' do
      it 'not raise any error' do
        expect { Speed.new(1, 'mi/h') }.to_not raise_error
      end
    end
  end

  describe '.load_units_symbol' do
    it 'return ruby hash of length unit symbol form' do
      expect(Speed::UNITS_SYMBOL).to eq('meter/second' => 'm/s', 'meter/minute' => 'm/min',
                                        'kilometer/hour' => 'km/h', 'foot/second' => 'ft/s',
                                        'foot/minute' => 'ft/min', 'miles/hour' => 'mi/h')
    end
  end

  describe '.load_units' do
    it 'return list of valid units' do
      expect(Speed::UNITS).to eq(%w[m/s m/min km/h ft/s ft/min mi/h])
    end
  end

  describe 'check equal method' do
    let(:l1) { Speed.new 3.1415678, 'm/s' }
    let(:l2) { Speed.new 3.1415678, 'mi/h' }

    it 'not equal' do
      expect(l1 == l2).to eq(false)
    end

    it 'is equal' do
      l3 = l1.to 'km/h'
      expect(l1 == l3).to eq(true)
    end

    it 'is equal' do
      l4 = l2.to 'ft/min'
      expect(l4 == l2).to eq(true)
    end
  end

  describe 'check === method' do
    let(:l1) { Speed.new 1093.613, 'm/s' }
    let(:l2) { Speed.new 39370.08, 'ft/min' }
    let(:l3) { Speed.new 1093.613, 'm/s' }

    it 'not equal' do
      expect(l1 === l2).to eq(false)
    end

    it 'is not equal' do
      l4 = l1.to 'mi/h'
      expect(l3 === l4).to eq(false)
    end

    it 'is equal' do
      expect(l1 === l3).to eq(true)
    end
  end

  describe 'check + method' do
    let(:m) { Speed.new 1093.613, 'm/min' }
    let(:k) { Speed.new 1000, 'km/h' }
    it 'return 0.17758283e5 m/min' do
      expect((m + k).value).to eq(0.17758283e5)
      expect((m + k).unit).to eq('m/min')
    end

    it 'return 10937130.0 km/h' do
      expect((k + m).value).to eq(0.1065624435291e4)
      expect((k + m).unit).to eq('km/h')
    end
  end

  describe 'check - method' do
    let(:m) { Speed.new 1093.613, 'm/min' }
    let(:k) { Speed.new 1000, 'km/h' }
    it 'return 1093.713 m/min' do
      expect((m - k).value).to eq(-0.15571057e5)
      expect((m - k).unit).to eq('m/min')
    end

    it 'return 0.934375564709e3 km/h' do
      expect((k - m).value.to_f).to eq(0.934375564709e3)
      expect((k - m).unit).to eq('km/h')
    end
  end
end
