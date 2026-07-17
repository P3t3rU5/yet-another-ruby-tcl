module Tcl
  module Delegator
    def self.included(klass)
      klass.class_eval do
        attr_reader :interp
      end
    end

    def method_missing(name, ...)
      interp.respond_to?(name) ? interp.send(name, ...) : super
    end

    def respond_to_missing?(name, include_private = false)
      interp.respond_to?(name, include_private) || super
    end
  end
end
