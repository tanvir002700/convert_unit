module ConvertUnit
  RSpec.describe Density, type: :class do
    context 'initiate object with wrong unit type argument' do
      it 'raise a TypeError' do
        expect { Density.new(1, 2) }.to raise_error(TypeError, 'Invalid Unit Type')
      end
    end

    context 'initiate object with worng unit argument' do
      it 'raise a TypeError' do
        expect { Density.new(1, 'degre') }.to raise_error(TypeError, 'Invalid Unit Type')
      end
    end

    context 'initiate object with wrong value' do
      it 'raise a TypeError' do
        expect { Density.new('abc', 'cm2') }.to raise_error(TypeError)
      end
    end

    context 'initiate object with valid value' do
      it 'not raise any error' do
        expect { Density.new(1, 'kg/m3') }.to_not raise_error
      end
    end

    context 'initiate object with short form of unit' do
      it 'not raise any error' do
        expect { Density.new(1, 'lb/ft3') }.to_not raise_error
      end
    end
  end

  describe '.load_units_symbol' do
    it 'return ruby hash of length unit symbol form' do
      expect(Density::UNITS_SYMBOL).to eq("gram/milliliter" => "g/ml", "kilogram/meter_cube" => "kg/m3",
                                          "pound/foot_cube"=>"lb/ft3", "pound/inch_cube"=>"lb/in3")
    end
  end

  describe '.load_units' do
    it 'return list of valid units' do
      expect(Density::UNITS).to eq(%w[g/ml kg/m3 lb/ft3 lb/in3])
    end
  end

  describe 'check equal method' do
    let(:l1) { Density.new 3.1415678, 'g/ml' }
    let(:l2) { Density.new 3.1415678, 'kg/m3' }

    it 'not equal' do
      expect(l1 == l2).to eq(false)
    end

    it 'is equal' do
      l3 = l1.to 'lb/in3'
      expect(l1 == l3).to eq(true)
    end

    it 'is equal' do
      l4 = l2.to 'lb/ft3'
      expect(l4 == l2).to eq(true)
    end
  end

  describe 'check === method' do
    let(:l1) { Density.new 1093.613, 'g/ml' }
    let(:l2) { Density.new 39370.08, 'kg/m3' }
    let(:l3) { Density.new 1093.613, 'g/ml' }

    it 'not equal' do
      expect(l1 === l2).to eq(false)
    end

    it 'is not equal' do
      l4 = l1.to 'lb/ft3'
      expect(l3 === l4).to eq(false)
    end

    it 'is equal' do
      expect(l1 === l3).to eq(true)
    end
  end

  describe 'check + method' do
    let(:g) { Density.new 3, 'g/ml' }
    let(:kg) { Density.new 1000, 'kg/m3' }
    it 'return 4 g/ml' do
      expect((g + kg).value).to eq(4.0)
      expect((g + kg).unit).to eq('g/ml')
    end

    it 'return 4000 kg/m3' do
      expect((kg + g).value).to eq(4000.0)
      expect((kg + g).unit).to eq('kg/m3')
    end
  end

  describe 'check - method' do
    let(:g) { Density.new 3, 'g/ml' }
    let(:kg) { Density.new 1000, 'kg/m3' }
    it 'return 2 g/ml' do
      expect((g - kg).value).to eq(2)
      expect((g - kg).unit).to eq('g/ml')
    end

    it 'return -2000 kg/m3' do
      expect((kg - g).value).to eq(-2000)
      expect((kg - g).unit).to eq('kg/m3')
    end
  end
end
