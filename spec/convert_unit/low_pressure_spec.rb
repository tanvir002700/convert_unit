module ConvertUnit
  RSpec.describe LowPressure, type: :class do
    context 'initiate object with wrong unit type argument' do
      it 'raise a TypeError' do
        expect { LowPressure.new(1, 2) }.to raise_error(TypeError, 'Invalid Unit Type')
      end
    end

    context 'initiate object with worng unit argument' do
      it 'raise a TypeError' do
        expect { LowPressure.new(1, 'degre') }.to raise_error(TypeError, 'Invalid Unit Type')
      end
    end

    context 'initiate object with wrong value' do
      it 'raise a TypeError' do
        expect { LowPressure.new('abc', 'cm2') }.to raise_error(TypeError)
      end
    end

    context 'initiate object with valid value' do
      it 'not raise any error' do
        expect { LowPressure.new(1, 'kilopascal') }.to_not raise_error
      end
    end

    context 'initiate object with short form of unit' do
      it 'not raise any error' do
        expect { LowPressure.new(1, 'kpa') }.to_not raise_error
      end
    end
  end

  describe '.load_units_symbol' do
    it 'return ruby hash of length unit symbol form' do
      expect(LowPressure::UNITS_SYMBOL).to eq('bar' => 'bar', 'pound/square_inch' => 'psi',
                                               'kilopascal' => 'kpa', 'megapascal' => 'mpa',
                                               'kilogram_force/centimeter_square' => 'kgf/cm2',
                                               'millimeter_of_mercury' => 'mm_hg', 'Atmospheres' => 'atm')
    end
  end

  describe '.load_units' do
    it 'return list of valid units' do
      expect(LowPressure::UNITS).to eq(%w[bar psi kpa mpa kgf/cm2 mm_hg atm])
    end
  end

  describe 'check equal method' do
    let(:l1) { LowPressure.new 3.1415678, 'psi' }
    let(:l2) { LowPressure.new 3.1415678, 'bar' }

    it 'not equal' do
      expect(l1 == l2).to eq(false)
    end

    it 'is equal' do
      l3 = l1.to 'bar'
      expect(l1 == l3).to eq(true)
    end

    it 'is equal' do
      l4 = l2.to 'psi'
      expect(l4 == l2).to eq(true)
    end
  end

  describe 'check === method' do
    let(:l1) { LowPressure.new 1093.613, 'bar' }
    let(:l2) { LowPressure.new 39370.08, 'atm' }
    let(:l3) { LowPressure.new 1093.613, 'bar' }

    it 'not equal' do
      expect(l1 === l2).to eq(false)
    end

    it 'is not equal' do
      l4 = l1.to 'psi'
      expect(l3 === l4).to eq(false)
    end

    it 'is equal' do
      expect(l1 === l3).to eq(true)
    end
  end

  describe 'check + method' do
    let(:bar) { LowPressure.new 1093.613, 'bar' }
    let(:psi) { LowPressure.new 1000, 'psi' }
    it 'return 1162.563 bar' do
      expect((bar + psi).value).to eq(1162.563)
      expect((bar + psi).unit).to eq('bar')
    end

    it 'return 16860.95367838 psi' do
      expect((psi + bar).value).to eq(16860.95367838)
      expect((psi + bar).unit).to eq('psi')
    end
  end

  describe 'check - method' do
    let(:bar) { LowPressure.new 1093.613, 'bar' }
    let(:psi) { LowPressure.new 1000, 'psi' }
    it 'return 1024.663 bar' do
      expect((bar - psi).value).to eq(1024.663)
      expect((bar - psi).unit).to eq('bar')
    end

    it 'return -10935130.0 psi' do
      expect((psi - bar).value).to eq(-14860.95367838)
      expect((psi - bar).unit).to eq('psi')
    end
  end
end
