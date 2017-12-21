#module ConvertUnit
  class Base
    attr_accessor :value, :unit

    def initialize(value, unit, valid_units)
      puts "called super"
      puts value
      puts unit
      puts valid_units
      raise TypeError, 'no implicit conversion of String into Integer' unless value.is_a? Numeric
      raise TypeError, 'Invalid type' unless valid_units.include?(unit.to_s.downcase)
      @value = value
      @unit = unit.downcase
    end
  end

  class Length < Base
    UNITS = ['kilometre', 'metre', 'centemetre', 'millimetre', 'nanometre', 'mile', 'yard', 'foot', 'inch', 'nauticalmile']

    attr_accessor :value, :unit

    def initialize(value, unit)
      super(value, unit, Length::UNITS)
    end
  end
#end
