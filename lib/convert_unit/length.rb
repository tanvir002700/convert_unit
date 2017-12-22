require 'convert_unit/base'
require 'convert_unit/pre_process/length/load_yml'

module ConvertUnit
  class Length < Base
    extend PreProcess::Length

    UNITS = load_units
    attr_accessor :value, :unit

    def initialize(value, unit)
      super(value, unit, Length::UNITS)
    end
  end
end
