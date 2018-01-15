require 'convert_unit/base'
require 'convert_unit/pre_process/high_pressure/process'

module ConvertUnit
  class HighPressure < Base
    extend PreProcess::HighPressure
    UNITS_SYMBOL = load_units_symbol
    UNITS = load_available_units
    CONVERSION_RATE = load_conversion_rate

    attr_accessor :value, :unit

    def initialize(value, unit)
      unit_symbol = HighPressure::UNITS_SYMBOL[unit] || unit
      @conversion_rate_for_one_unit = HighPressure::CONVERSION_RATE
      super(value, unit_symbol, HighPressure::UNITS)
    end

    def to(c_unit)
      c_unit.downcase!
      unit_symbol = HighPressure::UNITS_SYMBOL[c_unit] || c_unit
      raise ArgumentError, 'Impossible conversion type' unless HighPressure::UNITS.include?(unit_symbol)
      HighPressure.new(convert_to(unit_symbol), unit_symbol)
    end
  end
end
