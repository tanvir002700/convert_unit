module ConvertUnit
  RSpec.describe VolumetricGasFlow, type: :class do
    context 'initiate object with wrong unit type argument' do
      it 'raise a TypeError' do
        expect { VolumetricGasFlow.new(1, 2) }.to raise_error(TypeError, 'Invalid Unit Type')
      end
    end

    context 'initiate object with worng unit argument' do
      it 'raise a TypeError' do
        expect { VolumetricGasFlow.new(1, 'degre') }.to raise_error(TypeError, 'Invalid Unit Type')
      end
    end

    context 'initiate object with wrong value' do
      it 'raise a TypeError' do
        expect { VolumetricGasFlow.new('abc', 'scfm') }.to raise_error(TypeError)
      end
    end

    context 'initiate object with valid value' do
      it 'not raise any error' do
        expect { VolumetricGasFlow.new(1, 'nm3/hr') }.to_not raise_error
      end
    end

    context 'initiate object with short form of unit' do
      it 'not raise any error' do
        expect { VolumetricGasFlow.new(1, 'scfm') }.to_not raise_error
      end
    end
  end

  describe '.load_units_symbol' do
    it 'return ruby hash of length unit symbol form' do
      expect(VolumetricGasFlow::UNITS_SYMBOL).to eq('normal_meter_cube/hour' => 'nm3/hr',
                                                    'standard_cubic_feet/hour' => 'scfh',
                                                    'standard_cubic_feet/minute' => 'scfm')
    end
  end

  describe '.load_units' do
    it 'return list of valid units' do
      expect(VolumetricGasFlow::UNITS).to eq(%w[nm3/hr scfh scfm])
    end
  end

  describe 'check equal method' do
    let(:l1) { VolumetricGasFlow.new 3.1415678, 'scfm' }
    let(:l2) { VolumetricGasFlow.new 3.1415678, 'scfh' }

    it 'not equal' do
      expect(l1 == l2).to eq(false)
    end

    it 'is equal' do
      l3 = l1.to 'scfh'
      expect(l1 == l3).to eq(true)
    end

    it 'is equal' do
      l4 = l2.to 'scfm'
      expect(l4 == l2).to eq(true)
    end
  end

  describe 'check === method' do
    let(:l1) { VolumetricGasFlow.new 1093.613, 'scfm' }
    let(:l2) { VolumetricGasFlow.new 39370.08, 'scfh' }
    let(:l3) { VolumetricGasFlow.new 1093.613, 'scfm' }

    it 'not equal' do
      expect(l1 === l2).to eq(false)
    end

    it 'is not equal' do
      l4 = l1.to 'scfh'
      expect(l3 === l4).to eq(false)
    end

    it 'is equal' do
      expect(l1 === l3).to eq(true)
    end
  end

  describe 'check + method' do
    let(:v1) { VolumetricGasFlow.new 1093.613, 'scfm' }
    let(:v2) { VolumetricGasFlow.new 1000, 'scfh' }
    it 'return 1110.2820000000000 scfm' do
      expect((v1 + v2).value).to eq(1110.2820000000000)
      expect((v1 + v2).unit).to eq('scfm')
    end

    it 'return 66609.05909222 scfh' do
      expect((v2 + v1).value.to_f).to eq(66609.05909222)
      expect((v2 + v1).unit).to eq('scfh')
    end
  end

  describe 'check - method' do
    let(:v1) { VolumetricGasFlow.new 1093.613, 'scfm' }
    let(:v2) { VolumetricGasFlow.new 1000, 'scfh' }
    it 'return 1076.944 scfm' do
      expect((v1 - v2).value).to eq(1076.944)
      expect((v1 - v2).unit).to eq('scfm')
    end

    it 'return -64609.059092220000 scfh' do
      expect((v2 - v1).value).to eq(-64609.059092220000)
      expect((v2 - v1).unit).to eq('scfh')
    end
  end
end
