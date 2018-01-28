require 'yaml'
require 'convert_unit/pre_process/load'

module ConvertUnit
  module PreProcess
    module Torque
      include ConvertUnit::PreProcess

      def file_path
        File.dirname(__FILE__)
      end
    end
  end
end
