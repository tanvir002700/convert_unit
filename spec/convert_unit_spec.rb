RSpec.describe ConvertUnit do
  it 'has a version number' do
    expect(ConvertUnit::VERSION).not_to be nil
  end

  it 'does something useful' do
    expect(
      ConvertUnit.constants.select do |k|
        ConvertUnit.const_get(k).instance_of? Class
      end
    ).to eq(%I[Length Area Mass Volume])
  end
end
