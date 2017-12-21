require 'convert_unit/base'

module ConvertUnit
  class Length < Base
    UNITS = %W[kilometre metre centemetre millimetre nanometre mile yard foot inch nauticalmile'].freeze

    attr_accessor :value, :unit

    def initialize(value, unit)
      super(value, unit, Length::UNITS)
    end
  end
end
