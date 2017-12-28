module ConvertUnit
  RSpec.describe VolumetricLiquidFlow, type: :class do
    context 'initiate object with wrong unit type argument' do
      it 'raise a TypeError' do
        expect { VolumetricLiquidFlow.new(1, 2) }.to raise_error(TypeError, 'Invalid Unit Type')
      end
    end

    context 'initiate object with worng unit argument' do
      it 'raise a TypeError' do
        expect { VolumetricLiquidFlow.new(1, 'degre') }.to raise_error(TypeError, 'Invalid Unit Type')
      end
    end

    context 'initiate object with wrong value' do
      it 'raise a TypeError' do
        expect { VolumetricLiquidFlow.new('abc', 'cm2') }.to raise_error(TypeError)
      end
    end

    context 'initiate object with valid value' do
      it 'not raise any error' do
        expect { VolumetricLiquidFlow.new(1, 'liter/second') }.to_not raise_error
      end
    end

    context 'initiate object with short form of unit' do
      it 'not raise any error' do
        expect { VolumetricLiquidFlow.new(1, 'L/sec') }.to_not raise_error
      end
    end
  end

  describe '.load_units_symbol' do
    it 'return ruby hash of length unit symbol form' do
      expect(VolumetricLiquidFlow::UNITS_SYMBOL).to eq("liter/second" => "l/sec", "liter/minute" => "l/min",
                                                       "meter_cube/hour" => "m3", "foot_cube/minute" => "ft3/min",
                                                       "foot_cube/hour" => "ft3/hr", "us_gallons/minute" => "gal/min",
                                                       "us_barrels/day"=>"brl/d")
    end
  end

  describe '.load_units' do
    it 'return list of valid units' do
      expect(VolumetricLiquidFlow::UNITS).to eq(%w[l/sec l/min m3 ft3/min ft3/hr gal/min brl/d])
    end
  end

  describe 'check equal method' do
    let(:l1) { VolumetricLiquidFlow.new 3.1415678, 'l/sec' }
    let(:l2) { VolumetricLiquidFlow.new 3.1415678, 'l/min' }

    it 'not equal' do
      expect(l1 == l2).to eq(false)
    end

    it 'is equal' do
      l3 = l1.to 'brl/d'
      expect(l1 == l3).to eq(true)
    end

    it 'is equal' do
      l4 = l2.to 'gal/min'
      expect(l4 == l2).to eq(true)
    end
  end

  describe 'check === method' do
    let(:l1) { VolumetricLiquidFlow.new 1093.613, 'brl/d' }
    let(:l2) { VolumetricLiquidFlow.new 39370.08, 'gal/min' }
    let(:l3) { VolumetricLiquidFlow.new 1093.613, 'brl/d' }

    it 'not equal' do
      expect(l1 === l2).to eq(false)
    end

    it 'is not equal' do
      l4 = l1.to 'gal/min'
      expect(l3 === l4).to eq(false)
    end

    it 'is equal' do
      expect(l1 === l3).to eq(true)
    end
  end

  describe 'check + method' do
    let(:br) { VolumetricLiquidFlow.new 1093.613, 'brl/d' }
    let(:gal) { VolumetricLiquidFlow.new 1000, 'gal/min' }
    it 'return 35381.653 brl/d' do
      expect((br + gal).value).to eq(35381.653)
      expect((br + gal).unit).to eq('brl/d')
    end

    it 'return 1031.895223145 gal/min' do
      expect((gal + br).value).to eq(1031.895223145)
      expect((gal + br).unit).to eq('gal/min')
    end
  end

  describe 'check - method' do
    let(:br) { VolumetricLiquidFlow.new 1093.613, 'brl/d' }
    let(:gal) { VolumetricLiquidFlow.new 1000, 'gal/min' }
    it 'return -33194.427 br/d' do
      expect((br - gal).value).to eq(-33194.427)
      expect((br - gal).unit).to eq('brl/d')
    end

    it 'return 968.104776855 gal/min' do
      expect((gal - br).value).to eq(968.104776855)
      expect((gal - br).unit).to eq('gal/min')
    end
  end
end
