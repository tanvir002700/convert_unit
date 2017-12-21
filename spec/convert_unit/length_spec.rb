module ConvertUnit
  RSpec.describe Length do
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
        expect{Length.new('abc', 'metre')}.to raise_error(TypeError)
      end
    end

    context 'initiate object with valid value' do
      it 'not raise any error' do
        expect{Length.new(1, 'metre')}.to_not raise_error
      end
    end
  end
end
