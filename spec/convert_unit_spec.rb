RSpec.describe ConvertUnit do
  it 'has a version number' do
    expect(ConvertUnit::VERSION).not_to be nil
  end

  it 'does something useful' do
    expect(ConvertUnit.all_classes).to eq(%I[Length Area Mass Volume
                                             Density VolumetricLiquidFlow
                                             VolumetricGasFlow MassFlow])
  end
end
