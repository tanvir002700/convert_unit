module ConvertUnit
  RSpec.describe DynamicViscosity, type: :class do
    context 'initiate object with wrong unit type argument' do
      it 'raise a TypeError' do
        expect { DynamicViscosity.new(1, 2) }.to raise_error(TypeError, 'Invalid Unit Type')
      end
    end

    context 'initiate object with worng unit argument' do
      it 'raise a TypeError' do
        expect { DynamicViscosity.new(1, 'degre') }.to raise_error(TypeError, 'Invalid Unit Type')
      end
    end

    context 'initiate object with wrong value' do
      it 'raise a TypeError' do
        expect { DynamicViscosity.new('abc', 'cm2') }.to raise_error(TypeError)
      end
    end

    context 'initiate object with valid value' do
      it 'not raise any error' do
        expect { DynamicViscosity.new(1, 'poise') }.to_not raise_error
      end
    end

    context 'initiate object with short form of unit' do
      it 'not raise any error' do
        expect { DynamicViscosity.new(1, 'cp') }.to_not raise_error
      end
    end
  end

  describe '.load_units_symbol' do
    it 'return ruby hash of length unit symbol form' do
      expect(DynamicViscosity::UNITS_SYMBOL).to eq("centipoise"=>"cp", "poise"=>"poise", "pound/foot.second"=>"lb/ft·s")
    end
  end

  describe '.load_units' do
    it 'return list of valid units' do
      expect(DynamicViscosity::UNITS).to eq(%w[cp poise lb/ft·s])
    end
  end

  describe 'check equal method' do
    let(:l1) { DynamicViscosity.new 3.1415678, 'cp' }
    let(:l2) { DynamicViscosity.new 3.1415678, 'poise' }

    it 'not equal' do
      expect(l1 == l2).to eq(false)
    end

    it 'is equal' do
      l3 = l1.to 'lb/ft·s'
      expect(l1 == l3).to eq(true)
    end

    it 'is equal' do
      l4 = l2.to 'cp'
      expect(l4 == l2).to eq(true)
    end
  end

  describe 'check === method' do
    let(:l1) { DynamicViscosity.new 1093.613, 'cp' }
    let(:l2) { DynamicViscosity.new 39370.08, 'poise' }
    let(:l3) { DynamicViscosity.new 1093.613, 'cp' }

    it 'not equal' do
      expect(l1 === l2).to eq(false)
    end

    it 'is not equal' do
      l4 = l1.to 'poise'
      expect(l3 === l4).to eq(false)
    end

    it 'is equal' do
      expect(l1 === l3).to eq(true)
    end
  end

  describe 'check + method' do
    let(:cp) { DynamicViscosity.new 1093.613, 'cp' }
    let(:poise) { DynamicViscosity.new 1000, 'poise' }
    it 'return 0.101093613e6 cp' do
      expect((cp + poise).value).to eq(0.101093613e6)
      expect((cp + poise).unit).to eq('cp')
    end

    it 'return 0.101093613e4 poise' do
      expect((poise + cp).value).to eq(0.101093613e4)
      expect((poise + cp).unit).to eq('poise')
    end
  end

  describe 'check - method' do
    let(:cp) { DynamicViscosity.new 1093.613, 'cp' }
    let(:poise) { DynamicViscosity.new 1000, 'poise' }
    it 'return -0.98906387e5 cp' do
      expect((cp - poise).value).to eq(-0.98906387e5)
      expect((cp - poise).unit).to eq('cp')
    end

    it 'return 0.98906387e3 poise' do
      expect((poise - cp).value).to eq(0.98906387e3)
      expect((poise - cp).unit).to eq('poise')
    end
  end
end
