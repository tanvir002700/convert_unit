require 'convert_unit/base'
require 'convert_unit/pre_process/mass/process'

module ConvertUnit
  class Mass < Base
    extend PreProcess::Mass
    UNITS_SYMBOL = load_units_symbol
    UNITS = load_available_units
    CONVERSION_RATE = load_conversion_rate

    attr_accessor :value, :unit

    def initialize(value, unit)
      unit_symbol = Mass::UNITS_SYMBOL[unit] || unit
      @conversion_rate_for_one_unit = Mass::CONVERSION_RATE
      super(value, unit_symbol, Mass::UNITS)
    end

    def to(c_unit)
      c_unit.downcase!
      unit_symbol = Mass::UNITS_SYMBOL[c_unit] || c_unit
      raise ArgumentError, 'Unpossible conversion type' unless Mass::UNITS.include?(unit_symbol)
      Mass.new(convert_to(unit_symbol), unit_symbol)
    end
  end
end
