module ConvertUnit
  module PreProcess
    def file_path; end

    def load_units_short_form
      f = File.open(File.join(file_path, 'units_short_form.yml'))
      YAML.safe_load(f)
    end

    def load_available_units
      f = File.open(File.join(file_path, 'units.yml'))
      YAML.safe_load(f)
    end

    def load_conversion_rate
      f = File.open(File.join(file_path, 'conversion_rate.yml'))
      YAML.safe_load(f)
    end
  end
end
