case
when defined?(UNF::Normalizer)
  # Probably unf_ext is preloaded.
when String.method_defined?(:unicode_normalize)
  class String
    [:nfc, :nfd, :nfkc, :nfkd].each { |form|
      eval %{
        remove_method :to_#{form} if method_defined?(:to_#{form})

        def to_#{form}
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
else
  require 'unf_ext'
end
