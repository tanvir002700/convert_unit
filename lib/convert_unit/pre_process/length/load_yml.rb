module ConvertUnit
  module PreProcess
    module Length
      def load_units
        %W[kilometre metre centemetre millimetre nanometre mile yard foot inch nauticalmile'].freeze
      end
    end
  end
end
