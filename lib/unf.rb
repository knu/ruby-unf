if defined?(RUBY_ENGINE) && RUBY_ENGINE == 'jruby'
  require 'unf_jruby'
else
  require 'unf_ext'
end

class UNF::Normalizer
  class << self
    def instance
      @@normalizer ||= new
    end

    def normalize(string, form)
      instance.normalize(string, form)
    end
  end
end

class String
  [:nfc, :nfd, :nfkc, :nfkd].each { |form|
    eval %{
      def to_#{form.to_s}
        UNF::Normalizer.normalize(self, #{form.inspect})
      end
    }
  }
end
