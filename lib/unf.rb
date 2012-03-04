require 'unf/version'

module UNF
  autoload :Normalizer, 'unf/normalizer'
end

class String
  ascii_only =
    if method_defined?(:ascii_only?)
      'ascii_only?'
    else
      '/[^\x00-\x7f]/ !~ self'
    end

  [:nfc, :nfd, :nfkc, :nfkd].each { |form|
    eval %{
      def to_#{form.to_s}
        if #{ascii_only}
          self
        else
          UNF::Normalizer.normalize(self, #{form.inspect})
        end
      end
    }
  }
end
