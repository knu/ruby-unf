begin
  require 'unf_ext'
rescue LoadError
  String.method_defined?(:unicode_normalize) or raise

  class String
    [:nfc, :nfd, :nfkc, :nfkd].each { |form|
      eval %{
        def to_#{form.to_s}
          unicode_normalize(#{form.inspect})
        end
      }
    }
  end

  module UNF # :nodoc: all
    class Normalizer
      def normalize(string, normalization_form)
        String.try_convert(string).unicode_normalize(normalization_form)
      end
    end
  end
end
