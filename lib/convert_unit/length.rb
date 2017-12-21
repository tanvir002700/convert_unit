require 'convert_unit/base'

module ConvertUnit
  class Length < Base
    UNITS = ['kilometre', 'metre', 'centemetre', 'millimetre', 'nanometre', 'mile', 'yard', 'foot', 'inch', 'nauticalmile']

    attr_accessor :value, :unit

    def initialize(value, unit)
      super(value, unit, Length::UNITS)
    end
  end
end

