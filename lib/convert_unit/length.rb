module ConvertUnit
  class Length
    attr_accessor :value, :unit
    def initialize(value, unit)
      @value = value
      @unit = unit
    end
  end
end
