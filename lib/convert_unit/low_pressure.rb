require 'convert_unit/base'
require 'convert_unit/pre_process/low_pressure/process'

module ConvertUnit
  class LowPressure < Base
    extend PreProcess::LowPressure
    UNITS_SYMBOL = load_units_symbol
    UNITS = load_available_units
    CONVERSION_RATE = load_conversion_rate

    attr_accessor :value, :unit

    def initialize(value, unit)
      unit_symbol = LowPressure::UNITS_SYMBOL[unit] || unit
      @conversion_rate_for_one_unit = LowPressure::CONVERSION_RATE
      super(value, unit_symbol, LowPressure::UNITS)
    end

    def to(c_unit)
      c_unit.downcase!
      unit_symbol = LowPressure::UNITS_SYMBOL[c_unit] || c_unit
      raise ArgumentError, 'Impossible conversion type' unless LowPressure::UNITS.include?(unit_symbol)
      LowPressure.new(convert_to(unit_symbol), unit_symbol)
    end
  end
end
