class Base
  attr_accessor :value, :unit

  def initialize(value, unit, valid_units)
    raise TypeError, 'no implicit conversion of String into Integer' unless value.is_a? Numeric
    raise TypeError, 'Invalid Unit Type' unless valid_units.include?(unit.to_s.downcase)
    @value = value
    @unit = unit.downcase
  end

  def inspect
    "#{@value}#{@unit}"
  end

  protected

  def convert_to(c_unit)
    conversion_rate = @conversion_rate_for_one_unit[unit][c_unit]
    conversion_rate = format('%<value>f', value: conversion_rate).to_f
    conversion_rate * value
  end
end
