module ConvertUnit
  RSpec.describe MassFlow, type: :class do
    context 'initiate object with wrong unit type argument' do
      it 'raise a TypeError' do
        expect { MassFlow.new(1, 2) }.to raise_error(TypeError, 'Invalid Unit Type')
      end
    end

    context 'initiate object with worng unit argument' do
      it 'raise a TypeError' do
        expect { MassFlow.new(1, 'degre') }.to raise_error(TypeError, 'Invalid Unit Type')
      end
    end

    context 'initiate object with wrong value' do
      it 'raise a TypeError' do
        expect { MassFlow.new('abc', 'cm2') }.to raise_error(TypeError)
      end
    end

    context 'initiate object with valid value' do
      it 'not raise any error' do
        expect { MassFlow.new(1, 'kg/h') }.to_not raise_error
      end
    end

    context 'initiate object with symbol of unit' do
      it 'not raise any error' do
        expect { MassFlow.new(1, 'kilogram/hour') }.to_not raise_error
      end
    end
  end

  describe '.load_units_symbol' do
    it 'return ruby hash of length unit symbol form' do
      expect(MassFlow::UNITS_SYMBOL).to eq('kilogram/hour' => 'kg/h', 'pound/hour' => 'lb/h', 'kilogram/second' => 'kg/s', 'ton/hour' => 't/h')
    end
  end

  describe '.load_units' do
    it 'return list of valid units' do
      expect(MassFlow::UNITS).to eq(%w[kg/h lb/h kg/s t/h])
    end
  end

  describe 'check equal method' do
    let(:l1) { MassFlow.new 3.1415678, 'kg/h' }
    let(:l2) { MassFlow.new 3.1415678, 'kg/s' }

    it 'not equal' do
      expect(l1 == l2).to eq(false)
    end

    it 'is equal' do
      l3 = l1.to 't/h'
      expect(l1 == l3).to eq(true)
    end

    it 'is equal' do
      l4 = l2.to 'lb/h'
      expect(l4 == l2).to eq(true)
    end
  end

  describe 'check === method' do
    let(:l1) { MassFlow.new 1093.613, 'kg/h' }
    let(:l2) { MassFlow.new 39370.08, 'lb/h' }
    let(:l3) { MassFlow.new 1093.613, 'kg/h' }

    it 'not equal' do
      expect(l1 === l2).to eq(false)
    end

    it 'is not equal' do
      l4 = l1.to 'lb/h'
      expect(l3 === l4).to eq(false)
    end

    it 'is equal' do
      expect(l1 === l3).to eq(true)
    end
  end

  describe 'check + method' do
    let(:kg) { MassFlow.new 1093.613, 'kg/h' }
    let(:lb) { MassFlow.new 1000, 'lb/h' }
    it 'return 1547.2130000000002 kg/h' do
      expect((kg + lb).value).to eq(1547.2130000000002)
      expect((kg + lb).unit).to eq('kg/h')
    end

    it 'return 3410.963909218 lb/h' do
      expect((lb + kg).value).to eq(3410.963909218)
      expect((lb + kg).unit).to eq('lb/h')
    end
  end

  describe 'check - method' do
    let(:lb) { MassFlow.new 1093.613, 'lb/h' }
    let(:kg) { MassFlow.new 1000, 'kg/h' }
    it 'return 503.9371432 lb/h' do
      expect((kg - lb).value).to eq(503.9371432)
      expect((kg - lb).unit).to eq('kg/h')
    end

    it 'return -1110.9729999999997 lb/h' do
      expect((lb - kg).value).to eq(-1110.9729999999997)
      expect((lb - kg).unit).to eq('lb/h')
    end
  end
end
