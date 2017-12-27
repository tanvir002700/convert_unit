require 'convert_unit/base'
require 'convert_unit/pre_process/area/process'

module ConvertUnit
  class VolumetricGasFlow < Base
    extend PreProcess::VolumetricGasFlow
    UNITS_SYMBOL = load_units_symbol
    UNITS = load_available_units
    CONVERSION_RATE = load_conversion_rate

    attr_accessor :value, :unit

    def initialize(value, unit)
      unit_symbol = VolumetricGasFlow::UNITS_SYMBOL[unit] || unit
      @conversion_rate_for_one_unit = VolumetricGasFlow::CONVERSION_RATE
      super(value, unit_symbol, VolumetricGasFlow::UNITS)
    end

    def to(c_unit)
      c_unit.downcase!
      unit_symbol = VolumetricGasFlow::UNITS_SYMBOL[c_unit] || c_unit
      raise ArgumentError, 'Impossible conversion type' unless VolumetricGasFlow::UNITS.include?(unit_symbol)
      VolumetricGasFlow.new(convert_to(unit_symbol), unit_symbol)
    end
  end
end
