class Base
  attr_accessor :value, :unit

  def initialize(value, unit, list)
    puts "calling superk"
    @value = value
    @unit = unit
  end
end

