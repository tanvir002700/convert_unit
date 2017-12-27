require 'convert_unit/base'
require 'convert_unit/pre_process/torque/process'

module ConvertUnit
  class Torque < Base
    extend PreProcess::Torque
    UNITS_SYMBOL = load_units_symbol
    UNITS = load_available_units
    CONVERSION_RATE = load_conversion_rate

    attr_accessor :value, :unit

    def initialize(value, unit)
      unit_symbol = Torque::UNITS_SYMBOL[unit] || unit
      @conversion_rate_for_one_unit = Torque::CONVERSION_RATE
      super(value, unit_symbol, Torque::UNITS)
    end

    def to(c_unit)
      c_unit.downcase!
      unit_symbol = Torque::UNITS_SYMBOL[c_unit] || c_unit
      raise ArgumentError, 'Impossible conversion type' unless Torque::UNITS.include?(unit_symbol)
      Torque.new(convert_to(unit_symbol), unit_symbol)
    end
  end
end
