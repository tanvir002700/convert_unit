module ConvertUnit
  RSpec.describe KinematicViscosity, type: :class do
    context 'initiate object with wrong unit type argument' do
      it 'raise a TypeError' do
        expect { KinematicViscosity.new(1, 2) }.to raise_error(TypeError, 'Invalid Unit Type')
      end
    end

    context 'initiate object with worng unit argument' do
      it 'raise a TypeError' do
        expect { KinematicViscosity.new(1, 'degre') }.to raise_error(TypeError, 'Invalid Unit Type')
      end
    end

    context 'initiate object with wrong value' do
      it 'raise a TypeError' do
        expect { KinematicViscosity.new('abc', 'cs') }.to raise_error(TypeError)
      end
    end

    context 'initiate object with valid value' do
      it 'not raise any error' do
        expect { KinematicViscosity.new(1, 'ft2/s') }.to_not raise_error
      end
    end

    context 'initiate object with short form of unit' do
      it 'not raise any error' do
        expect { KinematicViscosity.new(1, 'cs') }.to_not raise_error
      end
    end
  end

  describe '.load_units_symbol' do
    it 'return ruby hash of length unit symbol form' do
      expect(KinematicViscosity::UNITS_SYMBOL).to eq('centistoke' => 'cs', 'stoke' => 'st',
                                                     'foot_square/second' => 'ft2/s', 'meter_square/second' => 'm2/s')
    end
  end

  describe '.load_units' do
    it 'return list of valid units' do
      expect(KinematicViscosity::UNITS).to eq(%w[cs st ft2/s m2/s])
    end
  end

  describe 'check equal method' do
    let(:l1) { KinematicViscosity.new 3.1415678, 'cs' }
    let(:l2) { KinematicViscosity.new 3.1415678, 'st' }

    it 'not equal' do
      expect(l1 == l2).to eq(false)
    end

    it 'is equal' do
      l3 = l1.to 'st'
      expect(l1 == l3).to eq(true)
    end

    it 'is equal' do
      l4 = l2.to 'ft2/s'
      expect(l4 == l2).to eq(true)
    end
  end

  describe 'check === method' do
    let(:l1) { KinematicViscosity.new 1093.613, 'cs' }
    let(:l2) { KinematicViscosity.new 39370.08, 'st' }
    let(:l3) { KinematicViscosity.new 1093.613, 'cs' }

    it 'not equal' do
      expect(l1 === l2).to eq(false)
    end

    it 'is not equal' do
      l4 = l1.to 'st'
      expect(l3 === l4).to eq(false)
    end

    it 'is equal' do
      expect(l1 === l3).to eq(true)
    end
  end

  describe 'check + method' do
    let(:cs) { KinematicViscosity.new 1093.613, 'cs' }
    let(:st) { KinematicViscosity.new 1000, 'st' }
    it 'return 0.101093613e6 cs' do
      expect((cs + st).value).to eq(0.101093613e6)
      expect((cs + st).unit).to eq('cs')
    end

    it 'return 0.101093613e4 st' do
      expect((st + cs).value).to eq(0.101093613e4)
      expect((st + cs).unit).to eq('st')
    end
  end

  describe 'check - method' do
    let(:v1) { KinematicViscosity.new 1093.613, 'ft2/s' }
    let(:v2) { KinematicViscosity.new 1000, 'm2/s' }
    it 'return -0.9670307e4 ft2/s' do
      expect((v1 - v2).value.to_f).to eq(-0.9670307e4)
      expect((v1 - v2).unit).to eq('ft2/s')
    end

    it 'return 0.964016851461e3 m2/s' do
      expect((v2 - v1).value).to eq(0.964016851461e3)
      expect((v2 - v1).unit).to eq('m2/s')
    end
  end
end
