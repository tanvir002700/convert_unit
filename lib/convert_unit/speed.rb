require 'convert_unit/base'
require 'convert_unit/pre_process/speed/process'

module ConvertUnit
  class Speed < Base
    extend PreProcess::Speed
    UNITS_SYMBOL = load_units_symbol
    UNITS = load_available_units
    CONVERSION_RATE = load_conversion_rate

    attr_accessor :value, :unit

    def initialize(value, unit)
      unit_symbol = Speed::UNITS_SYMBOL[unit] || unit
      @conversion_rate_for_one_unit = Speed::CONVERSION_RATE
      super(value, unit_symbol, Speed::UNITS)
    end

    def to(c_unit)
      c_unit.downcase!
      unit_symbol = Speed::UNITS_SYMBOL[c_unit] || c_unit
      raise ArgumentError, 'Impossible conversion type' unless Speed::UNITS.include?(unit_symbol)
      Speed.new(convert_to(unit_symbol), unit_symbol)
    end
  end
end
