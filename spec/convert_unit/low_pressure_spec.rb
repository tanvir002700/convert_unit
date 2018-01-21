module ConvertUnit
  RSpec.describe LowPressure, type: :class do
    context 'initiate object with wrong unit type argument' do
      it 'raise a TypeError' do
        expect { LowPressure.new(1, 2) }.to raise_error(TypeError, 'Invalid Unit Type')
      end
    end

    context 'initiate object with worng unit argument' do
      it 'raise a TypeError' do
        expect { LowPressure.new(1, 'degre') }.to raise_error(TypeError, 'Invalid Unit Type')
      end
    end

    context 'initiate object with wrong value' do
      it 'raise a TypeError' do
        expect { LowPressure.new('abc', 'cm2') }.to raise_error(TypeError)
      end
    end

    context 'initiate object with valid value' do
      it 'not raise any error' do
        expect { LowPressure.new(1, 'foot_of_water') }.to_not raise_error
      end
    end

    context 'initiate object with short form of unit' do
      it 'not raise any error' do
        expect { LowPressure.new(1, 'mH2o') }.to_not raise_error
      end
    end
  end

  describe '.load_units_symbol' do
    it 'return ruby hash of length unit symbol form' do
      expect(LowPressure::UNITS_SYMBOL).to eq('meter_of_water' => 'mh2o',
                                              'foot_of_water' => 'fth2o',
                                              'centimeter_of_mercury' => 'cmhg',
                                              'inches_of_mercury' => 'inhg',
                                              'inches_of_water' => 'inh2o',
                                              'pascal' => 'pa')
    end
  end

  describe '.load_units' do
    it 'return list of valid units' do
      expect(LowPressure::UNITS).to eq(%w[mh2o fth2o cmhg inhg inh2o pa])
    end
  end

  describe 'check equal method' do
    let(:l1) { LowPressure.new 3.1415678, 'mH2o' }
    let(:l2) { LowPressure.new 3.1415678, 'ftH2o' }

    it 'not equal' do
      expect(l1 == l2).to eq(false)
    end

    it 'is equal' do
      l3 = l1.to 'pa'
      expect(l1 == l3).to eq(true)
    end

    it 'is equal' do
      l4 = l2.to 'cmHg'
      expect(l4 == l2).to eq(true)
    end
  end

  describe 'check === method' do
    let(:l1) { LowPressure.new 1093.613, 'pa' }
    let(:l2) { LowPressure.new 39370.08, 'cmHg' }
    let(:l3) { LowPressure.new 1093.613, 'pa' }

    it 'not equal' do
      expect(l1 === l2).to eq(false)
    end

    it 'is not equal' do
      l4 = l1.to 'cmHg'
      expect(l3 === l4).to eq(false)
    end

    it 'is equal' do
      expect(l1 === l3).to eq(true)
    end
  end

  describe 'check + method' do
    let(:hg) { LowPressure.new 1093.613, 'cmHg' }
    let(:pa) { LowPressure.new 1000, 'pa' }
    it 'return 1094.363 cmHg' do
      expect((hg + pa).value).to eq(1094.363)
      expect((hg + pa).unit).to eq('cmhg')
    end

    it 'return 1458786.1290000002 pa' do
      expect((pa + hg).value).to eq(1458786.1290000002)
      expect((pa + hg).unit).to eq('pa')
    end
  end

  describe 'check - method' do
    let(:hg) { LowPressure.new 1093.613, 'cmHg' }
    let(:pa) { LowPressure.new 1000, 'pa' }
    it 'return 1092.863 cmHg' do
      expect((hg - pa).value).to eq(1092.863)
      expect((hg - pa).unit).to eq('cmhg')
    end

    it 'return -1456786.1290000002 pa' do
      expect((pa - hg).value).to eq(-1456786.1290000002)
      expect((pa - hg).unit).to eq('pa')
    end
  end
end
