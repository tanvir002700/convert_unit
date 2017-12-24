module ConvertUnit
  RSpec.describe Length, type: :class do
    context 'initiate object with wrong unit type argument' do
      it 'raise a TypeError' do
        expect{Length.new(1,2)}.to raise_error(TypeError, 'Invalid Unit Type')
      end
    end

    context 'initiate object with worng unit argument' do
      it 'raise a TypeError' do
        expect{Length.new(1, 'degre')}.to raise_error(TypeError, 'Invalid Unit Type')
      end
    end

    context 'initiate object with wrong value' do
      it 'raise a TypeError' do
        expect{Length.new('abc', 'meter')}.to raise_error(TypeError)
      end
    end

    context 'initiate object with valid value' do
      it 'not raise any error' do
        expect{Length.new(1, 'meter')}.to_not raise_error
      end
    end

    context 'initiate object with short form of unit' do
      it 'not raise any error' do
        expect{Length.new(1, 'km')}.to_not raise_error
      end
    end
  end

  describe '.load_units_short_form' do
    it 'return ruby hash of length unit short form' do
      expect(Length::load_units_short_form).to eq({"millimeter"=>"mm", "centimeter"=>"cm", "meter"=>"m", "kilometer"=>"km", "inche"=>"in", "feet"=>"ft", "yard"=>"yd", "mile"=>"mi"})
    end
  end

  describe '.load_units' do
    it 'return list of valid units' do
      expect(Length::load_units).to eq(['mm', 'cm', 'm', 'km', 'in', 'ft', 'yd', 'mi'])
    end
  end

  describe 'check equal method' do
    let(:l1) { Length.new 3.1415678, 'mm' }
    let(:l2) { Length.new 3.1415678, 'ft' }

    it 'not equal' do
      expect(l1 == l2).to eq(false)
    end

    it 'is equal' do
      l3 = l1.to 'ft'
      expect(l1==l3).to eq(true)
    end

    it 'is equal' do
      l4 = l2.to 'mi'
      expect(l4==l2).to eq(true)
    end
  end

  describe 'check === method' do
    let(:l1) { Length.new 1093.613, 'in' }
    let(:l2) { Length.new 39370.08, 'yd' }
    let(:l3) { Length.new 1093.613, 'in' }

    it 'not equal' do
      expect(l1 === l2).to eq(false)
    end

    it 'is not equal' do
      l4 = l1.to 'yd'
      expect(l3 === l4).to eq(false)
    end

    it 'is equal' do
      expect(l1 === l3).to eq(true)
    end
  end
end
