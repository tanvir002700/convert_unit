module ConvertUnit
  RSpec.describe Area, type: :class do
    context 'initiate object with wrong unit type argument' do
      it 'raise a TypeError' do
        expect{Area.new(1,2)}.to raise_error(TypeError, 'Invalid Unit Type')
      end
    end

    context 'initiate object with worng unit argument' do
      it 'raise a TypeError' do
        expect{Area.new(1, 'degre')}.to raise_error(TypeError, 'Invalid Unit Type')
      end
    end

    context 'initiate object with wrong value' do
      it 'raise a TypeError' do
        expect{Area.new('abc', 'cm2')}.to raise_error(TypeError)
      end
    end

    context 'initiate object with valid value' do
      it 'not raise any error' do
        expect{Area.new(1, 'cm2')}.to_not raise_error
      end
    end

    context 'initiate object with short form of unit' do
      it 'not raise any error' do
        expect{Area.new(1, 'm2')}.to_not raise_error
      end
    end
  end

  describe '.load_units_symbol' do
    it 'return ruby hash of length unit symbol form' do
      expect(Area::load_units_symbol).to eq({ 'meter_square'=>'m2', 'centimeter_square'=>'cm2', 'inch_square'=>'in2',
                                              'foot_square'=>'ft2', 'yard_square'=>'yd2' })
    end
  end

  describe '.load_units' do
    it 'return list of valid units' do
      expect(Area::UNITS).to eq(%w[mm2 cm2 m2 in2 ft2 yd2])
    end
  end

  describe 'check equal method' do
    let(:l1) { Area.new 3.1415678, 'mm2' }
    let(:l2) { Area.new 3.1415678, 'ft2' }

    it 'not equal' do
      expect(l1 == l2).to eq(false)
    end

    it 'is equal' do
      l3 = l1.to 'ft2'
      expect(l1 == l3).to eq(true)
    end

    it 'is equal' do
      l4 = l2.to 'mm2'
      expect(l4 == l2).to eq(true)
    end
  end

  describe 'check === method' do
    let(:l1) { Area.new 1093.613, 'in2' }
    let(:l2) { Area.new 39370.08, 'ft2' }
    let(:l3) { Area.new 1093.613, 'in2' }

    it 'not equal' do
      expect(l1 === l2).to eq(false)
    end

    it 'is not equal' do
      l4 = l1.to 'mm2'
      expect(l3 === l4).to eq(false)
    end

    it 'is equal' do
      expect(l1 === l3).to eq(true)
    end
  end

  describe 'check + method' do
    let(:m) { Area.new 1093.613, 'm2' }
    let(:cm) { Area.new 1000, 'cm2' }
    it 'return 1093.713 m2' do
      expect((m + cm).value).to eq(1093.713)
      expect((m + cm).unit).to eq('m2')
    end

    it 'return 10937130.0 m2' do
      expect((cm + m).value).to eq(10937130.0)
      expect((cm + m).unit).to eq('cm2')
    end
  end

  describe 'check - method' do
    let(:m) { Area.new 1093.613, 'm2' }
    let(:cm) { Area.new 1000, 'cm2' }
    it 'return 1093.5130000000001m2' do
      expect((m - cm).value).to eq(1093.5130000000001)
      expect((m - cm).unit).to eq('m2')
    end

    it 'return -10935130.0cm2' do
      expect((cm - m).value).to eq(-10935130.0)
      expect((cm - m).unit).to eq('cm2')
    end
  end
end
