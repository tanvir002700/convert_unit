module ConvertUnit
  def self.all_classes
    constants.select do |k|
      const_get(k).instance_of? Class
    end
  end
end
