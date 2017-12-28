module ConvertUnit
  def self.all_classes
    self.constants.select do |k|
      self.const_get(k).instance_of? Class
    end
  end
end
