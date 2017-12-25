require 'yaml'
require 'convert_unit/pre_process/load'

module ConvertUnit
  module PreProcess
    module Mass
      include ConvertUnit::PreProcess

      def file_path
        File.dirname(__FILE__)
      end
    end
  end
end
