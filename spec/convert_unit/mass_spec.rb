module ConvertUnit
  RSpec.describe Mass, type: :class do
    context 'initiate object with wrong unit type argument' do
      it 'raise a TypeError' do
        expect{Mass.new(1,2)}.to raise_error(TypeError, 'Invalid Unit Type')
      end
    end

    context 'initiate object with worng unit argument' do
      it 'raise a TypeError' do
        expect{Mass.new(1, 'degre')}.to raise_error(TypeError, 'Invalid Unit Type')
      end
    end

    context 'initiate object with wrong value' do
      it 'raise a TypeError' do
        expect{Mass.new('abc', 'cm2')}.to raise_error(TypeError)
      end
    end

    context 'initiate object with valid value' do
      it 'not raise any error' do
        expect{Mass.new(1, 'kg')}.to_not raise_error
      end
    end

    context 'initiate object with symbol of unit' do
      it 'not raise any error' do
        expect{Mass.new(1, 'tonne')}.to_not raise_error
      end
    end
  end

  describe '.load_units_symbol' do
    it 'return ruby hash of length unit symbol form' do
      expect(Mass::load_units_symbol).to eq({'grams'=>'g', 'kilograms'=>'kg', 'metric_tonnes'=>'tonne',
                                             'short_ton'=>'sh_ton', 'long_ton'=>'l_ton', 'pounds'=>'lb',
                                             'ounces'=>'oz'})
    end
  end

  describe '.load_units' do
    it 'return list of valid units' do
      expect(Mass::load_available_units).to eq(['g', 'kg', 'tonne', 'sh_ton', 'l_ton', 'lb', 'oz'])
    end
  end

  describe 'check equal method' do
    let(:l1) { Mass.new 3.1415678, 'kg' }
    let(:l2) { Mass.new 3.1415678, 'g' }

    it 'not equal' do
      expect(l1 == l2).to eq(false)
    end

    it 'is equal' do
      l3 = l1.to 'g'
      expect(l1==l3).to eq(true)
    end

    it 'is equal' do
      l4 = l2.to 'tonne'
      expect(l4==l2).to eq(true)
    end
  end

  describe 'check === method' do
    let(:l1) { Mass.new 1093.613, 'kg' }
    let(:l2) { Mass.new 39370.08, 'lb' }
    let(:l3) { Mass.new 1093.613, 'kg' }

    it 'not equal' do
      expect(l1 === l2).to eq(false)
    end

    it 'is not equal' do
      l4 = l1.to 'lb'
      expect(l3 === l4).to eq(false)
    end

    it 'is equal' do
      expect(l1 === l3).to eq(true)
    end
  end

  describe 'check + method' do
    let(:kg) { Mass.new 1093.613, 'kg' }
    let(:lb) { Mass.new 1000, 'lb' }
    it 'return 1547.2130000000002 kg' do
      expect((kg + lb).value).to eq(1547.2130000000002)
      expect((kg + lb).unit).to eq('kg')
    end

    it 'return 3410.963909218 lb' do
      expect((lb + kg).value).to eq(3410.963909218)
      expect((lb + kg).unit).to eq('lb')
    end
  end

  describe 'check - method' do
    let(:lb) { Mass.new 1093.613, 'lb' }
    let(:kg) { Mass.new 1000, 'kg' }
    it 'return 503.9371432 lb' do
      expect((kg - lb).value).to eq(503.9371432)
      expect((kg - lb).unit).to eq('kg')
    end

    it 'return -1110.9729999999997 lb' do
      expect((lb - kg).value).to eq(-1110.9729999999997)
      expect((lb - kg).unit).to eq('lb')
    end
  end
end

