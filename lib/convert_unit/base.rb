class Base
  attr_accessor :value, :unit

  def initialize(value, unit, valid_units)
    raise TypeError, 'no implicit conversion of String into Integer' unless value.is_a? Numeric
    raise TypeError, 'Invalid type' unless valid_units.include?(unit.to_s.downcase)
    @value = value
    @unit = unit.downcase
  end
end
