module ConvertUnit
  RSpec.describe Volume, type: :class do
    context 'initiate object with wrong unit type argument' do
      it 'raise a TypeError' do
        expect{Volume.new(1,2)}.to raise_error(TypeError, 'Invalid Unit Type')
      end
    end

    context 'initiate object with worng unit argument' do
      it 'raise a TypeError' do
        expect{Volume.new(1, 'degre')}.to raise_error(TypeError, 'Invalid Unit Type')
      end
    end

    context 'initiate object with wrong value' do
      it 'raise a TypeError' do
        expect{Volume.new('abc', 'cm2')}.to raise_error(TypeError)
      end
    end

    context 'initiate object with valid value' do
      it 'not raise any error' do
        expect{Volume.new(1, 'ltr')}.to_not raise_error
      end
    end

    context 'initiate object with symbol of unit' do
      it 'not raise any error' do
        expect{Volume.new(1, 'meter_cube')}.to_not raise_error
      end
    end
  end

  describe '.load_units_symbol' do
    it 'return ruby hash of length unit symbol form' do
      expect(Volume::load_units_symbol).to eq({"centimeter_cube"=>"cm3", "meter_cube"=>"m3", "liter"=>"ltr", "inch_cube"=>"in3", "foot_cube"=>"ft3", "uS_gallons"=>"us_gal", "imperial_gallons"=>"imp_gal", "uS_barrel"=>"us_bal"})
    end
  end

  describe '.load_units' do
    it 'return list of valid units' do
      expect(Volume::load_available_units).to eq(["cm3", "m3", "ltr", "in3", "ft3", "us_gal", "imp_gal", "us_brl"])
    end
  end

  describe 'check equal method' do
    let(:l1) { Volume.new 3.1415678, 'ltr' }
    let(:l2) { Volume.new 3.1415678, 'ft3' }

    it 'not equal' do
      expect(l1 == l2).to eq(false)
    end

    it 'is equal' do
      l3 = l1.to 'ft3'
      expect(l1==l3).to eq(true)
    end

    it 'is equal' do
      l4 = l2.to 'us_gal'
      expect(l4==l2).to eq(true)
    end
  end

  describe 'check === method' do
    let(:l1) { Volume.new 1093.613, 'ltr' }
    let(:l2) { Volume.new 39370.08, 'm3' }
    let(:l3) { Volume.new 1093.613, 'ltr' }

    it 'not equal' do
      expect(l1 === l2).to eq(false)
    end

    it 'is not equal' do
      l4 = l1.to 'cm3'
      expect(l3 === l4).to eq(false)
    end

    it 'is equal' do
      expect(l1 === l3).to eq(true)
    end
  end

  describe 'check + method' do
    let(:ltr) { Volume.new 1093.613, 'ltr' }
    let(:cm) { Volume.new 1000, 'cm3' }
    it 'return 160093.613 ltr' do
      expect((ltr + cm).value).to eq(160093.613)
      expect((ltr + cm).unit).to eq('ltr')
    end

    it 'return 1094613.0 cm3' do
      expect((cm + ltr).value).to eq(1094613.0)
      expect((cm + ltr).unit).to eq('cm3')
    end
  end

  describe 'check - method' do
    let(:ltr) { Volume.new 1093.613, 'ltr' }
    let(:m) { Volume.new 1000, 'm3' }
    it 'return -998906.387 ltr' do
      expect((ltr - m).value).to eq(-998906.387)
      expect((ltr - m).unit).to eq('ltr')
    end

    it 'return 998.906387 m3' do
      expect((m - ltr).value).to eq(998.906387)
      expect((m - ltr).unit).to eq('m3')
    end
  end
end

