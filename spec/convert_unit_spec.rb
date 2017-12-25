RSpec.describe ConvertUnit do
  it "has a version number" do
    expect(ConvertUnit::VERSION).not_to be nil
  end

  it "does something useful" do
    expect(
      ConvertUnit.constants.select { |k|
        ConvertUnit.const_get(k).instance_of? Class
      }
    ).to eq([:Length, :Area, :Mass])
  end
end
