require 'convert_unit/base'
require 'convert_unit/pre_process/length/process'

module ConvertUnit
  class Length < Base
    extend PreProcess::Length
    UNITS_SYMBOL = load_units_symbol
    UNITS = load_available_units
    CONVERSION_RATE = load_conversion_rate

    attr_accessor :value, :unit

    def initialize(value, unit)
      unit_symbol = Length::UNITS_SYMBOL[unit] || unit
      @conversion_rate_for_one_unit = Length::CONVERSION_RATE
      super(value, unit_symbol, Length::UNITS)
    end

    def to(c_unit)
      c_unit.downcase!
      unit_symbol = Length::UNITS_SYMBOL[c_unit] || c_unit
      raise ArgumentError, 'Unpossible conversion type' unless Length::UNITS.include?(unit_symbol)
      Length.new(convert_to(unit_symbol), unit_symbol)
    end
  end
end
