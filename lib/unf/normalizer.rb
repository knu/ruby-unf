if defined?(RUBY_ENGINE) && RUBY_ENGINE == 'jruby'
  require 'unf/normalizer_jruby'
else
  require 'unf/normalizer_cruby'
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
