require 'convert_unit/base'
require 'convert_unit/pre_process/area/process'

module ConvertUnit
  class Area < Base
    extend PreProcess::Area
    UNITS_SYMBOL = load_units_symbol
    UNITS = load_available_units
    CONVERSION_RATE = load_conversion_rate

    attr_accessor :value, :unit

    def initialize(value, unit)
      unit_symbol = Area::UNITS_SYMBOL[unit] || unit
      @conversion_rate_for_one_unit = Area::CONVERSION_RATE
      super(value, unit_symbol, Area::UNITS)
    end

    def to(c_unit)
      c_unit.downcase!
      unit_symbol = Area::UNITS_SYMBOL[c_unit] || c_unit
      raise ArgumentError, 'Impossible conversion type' unless Area::UNITS.include?(unit_symbol)
      Area.new(convert_to(unit_symbol), unit_symbol)
    end
  end
end
