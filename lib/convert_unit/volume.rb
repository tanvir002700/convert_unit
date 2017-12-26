require 'convert_unit/base'
require 'convert_unit/pre_process/volume/process'

module ConvertUnit
  class Volume < Base
    extend PreProcess::Volume
    UNITS_SYMBOL = load_units_symbol
    UNITS = load_available_units
    CONVERSION_RATE = load_conversion_rate

    attr_accessor :value, :unit

    def initialize(value, unit)
      unit_symbol = Volume::UNITS_SYMBOL[unit] || unit
      @conversion_rate_for_one_unit = Volume::CONVERSION_RATE
      super(value, unit_symbol, Volume::UNITS)
    end

    def to(c_unit)
      c_unit.downcase!
      unit_symbol = Volume::UNITS_SYMBOL[c_unit] || c_unit
      raise ArgumentError, 'Impossible conversion type' unless Volume::UNITS.include?(unit_symbol)
      Volume.new(convert_to(unit_symbol), unit_symbol)
    end
  end
end
