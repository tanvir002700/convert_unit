require 'yaml'
module ConvertUnit
  module PreProcess
    module Length
      def load_units_short_form
        f = File.open(File.join(File.dirname(__FILE__), 'units_short_form.yml'))
        YAML.load(f)
      end

      def load_units
        f = File.open(File.join(File.dirname(__FILE__), 'units.yml'))
        YAML.load(f)
      end
    end
  end
end
