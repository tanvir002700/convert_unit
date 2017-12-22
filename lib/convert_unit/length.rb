require 'convert_unit/base'
require 'convert_unit/pre_process/length/load_yml'

module ConvertUnit
  class Length < Base
    extend PreProcess::Length

    UNITS_SHORT_FORM = load_units_short_form
    UNITS = load_units

    attr_accessor :value, :unit

    def initialize(value, unit)
      unit_in_short = Length::UNITS_SHORT_FORM[unit] || unit
      super(value, unit_in_short, Length::UNITS)
    end
  end
end
