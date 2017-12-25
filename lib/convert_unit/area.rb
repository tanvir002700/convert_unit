require 'convert_unit/base'
require 'convert_unit/pre_process/area/process'

module ConvertUnit
  class Area < Base
    extend PreProcess::Area
    UNITS_SHORT_FORM = load_units_short_form
    UNITS = load_available_units
    CONVERSION_RATE = load_conversion_rate

    attr_accessor :value, :unit

    def initialize(value, unit)
      unit_in_short = Area::UNITS_SHORT_FORM[unit] || unit
      @conversion_rate_for_one_unit = Area::CONVERSION_RATE
      super(value, unit_in_short, Area::UNITS)
    end

    def to(c_unit)
      c_unit.downcase!
      unit_in_short = Area::UNITS_SHORT_FORM[c_unit] || c_unit
      raise ArgumentError, 'Unpossible conversion type' unless Area::UNITS.include?(unit_in_short)
      Area.new(convert_to(unit_in_short), unit_in_short)
    end
  end
end
