require 'convert_unit/base'
require 'convert_unit/pre_process/volumetric_liquid_flow/process'

module ConvertUnit
  class VolumetricLiquidFlow < Base
    extend PreProcess::VolumetricLiquidFlow
    UNITS_SYMBOL = load_units_symbol
    UNITS = load_available_units
    CONVERSION_RATE = load_conversion_rate

    attr_accessor :value, :unit

    def initialize(value, unit)
      unit_symbol = VolumetricLiquidFlow::UNITS_SYMBOL[unit] || unit
      @conversion_rate_for_one_unit = VolumetricLiquidFlow::CONVERSION_RATE
      super(value, unit_symbol, VolumetricLiquidFlow::UNITS)
    end

    def to(c_unit)
      c_unit.downcase!
      unit_symbol = VolumetricLiquidFlow::UNITS_SYMBOL[c_unit] || c_unit
      raise ArgumentError, 'Impossible conversion type' unless VolumetricLiquidFlow::UNITS.include?(unit_symbol)
      VolumetricLiquidFlow.new(convert_to(unit_symbol), unit_symbol)
    end
  end
end
