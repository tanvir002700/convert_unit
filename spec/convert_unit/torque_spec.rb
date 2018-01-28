module ConvertUnit
  RSpec.describe Torque, type: :class do
    context 'initiate object with wrong unit type argument' do
      it 'raise a TypeError' do
        expect { Torque.new(1, 2) }.to raise_error(TypeError, 'Invalid Unit Type')
      end
    end

    context 'initiate object with worng unit argument' do
      it 'raise a TypeError' do
        expect { Torque.new(1, 'degre') }.to raise_error(TypeError, 'Invalid Unit Type')
      end
    end

    context 'initiate object with wrong value' do
      it 'raise a TypeError' do
        expect { Torque.new('abc', 'cm2') }.to raise_error(TypeError)
      end
    end

    context 'initiate object with valid value' do
      it 'not raise any error' do
        expect { Torque.new(1, 'nm') }.to_not raise_error
      end
    end

    context 'initiate object with short form of unit' do
      it 'not raise any error' do
        expect { Torque.new(1, 'kgfm') }.to_not raise_error
      end
    end
  end

  describe '.load_units_symbol' do
    it 'return ruby hash of length unit symbol form' do
      expect(Torque::UNITS_SYMBOL).to eq('newton_meter' =>'nm', 'kilogram_force_meter'=>'kgfm',
                                         'foot_pound' => 'ftlb', 'inch_pound' => 'inlb')
    end
  end

  describe '.load_units' do
    it 'return list of valid units' do
      expect(Torque::UNITS).to eq(%w[nm kgfm ftlb inlb])
    end
  end

  describe 'check equal method' do
    let(:l1) { Torque.new 3.1415678, 'nm' }
    let(:l2) { Torque.new 3.1415678, 'kgfm' }

    it 'not equal' do
      expect(l1 == l2).to eq(false)
    end

    it 'is equal' do
      l3 = l1.to 'kgfm'
      expect(l1 == l3).to eq(true)
    end

    it 'is equal' do
      l4 = l2.to 'inlb'
      expect(l4 == l2).to eq(true)
    end
  end

  describe 'check === method' do
    let(:l1) { Torque.new 1093.613, 'nm' }
    let(:l2) { Torque.new 39370.08, 'ftlb' }
    let(:l3) { Torque.new 1093.613, 'nm' }

    it 'not equal' do
      expect(l1 === l2).to eq(false)
    end

    it 'is not equal' do
      l4 = l1.to 'kgfm'
      expect(l3 === l4).to eq(false)
    end

    it 'is equal' do
      expect(l1 === l3).to eq(true)
    end
  end

  describe 'check + method' do
    let(:v1) { Torque.new 1093.613, 'nm' }
    let(:v2) { Torque.new 1000, 'kgfm' }
    it 'return 0.10900262999999999e5 nm' do
      expect((v1 + v2).value.to_f).to eq(0.10900262999999999e5)
      expect((v1 + v2).unit).to eq('nm')
    end

    it 'return 0.1111517904836e4 kgfm' do
      expect((v2 + v1).value).to eq(0.1111517904836e4)
      expect((v2 + v1).unit).to eq('kgfm')
    end
  end

  describe 'check - method' do
    let(:v1) { Torque.new 1093.613, 'nm' }
    let(:v2) { Torque.new 1000, 'kgfm' }
    it 'return -0.8713036999999999e4 nm' do
      expect((v1 - v2).value.to_f).to eq(-0.8713036999999999e4)
      expect((v1 - v2).unit).to eq('nm')
    end

    it 'return 0.888482095164e3 kgfm' do
      expect((v2 - v1).value.to_f).to eq(0.888482095164e3)
      expect((v2 - v1).unit).to eq('kgfm')
    end
  end
end
