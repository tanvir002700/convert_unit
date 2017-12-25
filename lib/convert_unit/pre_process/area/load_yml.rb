require 'yaml'

module ConvertUnit
  module PreProcess
    module Area
      def load_units_short_form
        f = File.open(File.join(File.dirname(__FILE__), 'units_short_form.yml'))
        YAML.safe_load(f)
      end

      def load_available_units
        f = File.open(File.join(File.dirname(__FILE__), 'units.yml'))
        YAML.safe_load(f)
      end

      def load_conversion_rate
        f = File.open(File.join(File.dirname(__FILE__), 'conversion_rate.yml'))
        YAML.safe_load(f)
      end
    end
  end
end
