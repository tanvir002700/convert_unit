require 'convert_unit/base'
require 'convert_unit/pre_process/kinematic_viscosity/process'

module ConvertUnit
  class KinematicViscosity < Base
    extend PreProcess::KinematicViscosity
    UNITS_SYMBOL = load_units_symbol
    UNITS = load_available_units
    CONVERSION_RATE = load_conversion_rate

    attr_accessor :value, :unit

    def initialize(value, unit)
      unit_symbol = KinematicViscosity::UNITS_SYMBOL[unit] || unit
      @conversion_rate_for_one_unit = KinematicViscosity::CONVERSION_RATE
      super(value, unit_symbol, KinematicViscosity::UNITS)
    end

    def to(c_unit)
      c_unit.downcase!
      unit_symbol = KinematicViscosity::UNITS_SYMBOL[c_unit] || c_unit
      raise ArgumentError, 'Impossible conversion type' unless KinematicViscosity::UNITS.include?(unit_symbol)
      KinematicViscosity.new(convert_to(unit_symbol), unit_symbol)
    end
  end
end
