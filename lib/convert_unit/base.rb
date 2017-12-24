class Base
  attr_accessor :value, :unit

  def initialize(value, unit, valid_units)
    raise TypeError, 'no implicit conversion of String into Integer' unless value.is_a? Numeric
    raise TypeError, 'Invalid Unit Type' unless valid_units.include?(unit.to_s.downcase)
    @value = value
    @unit = unit.downcase
  end

  def ==(ob)
    a_to_b = one_unit_a_to_b(unit, ob.unit) * value
    b_to_a = one_unit_a_to_b(ob.unit, unit) * ob.value
    a_to_b == ob.value || b_to_a == value
  end

  def inspect
    "#{@value}#{@unit}"
  end

  protected

  def one_unit_a_to_b(unit_a, unit_b)
    conversion_rate = @conversion_rate_for_one_unit[unit_a][unit_b]
    conversion_rate = format('%<value>f', value: conversion_rate).to_f
  end

  def convert_to(c_unit)
    one_unit_a_to_b(unit, c_unit) * value
  end
end
