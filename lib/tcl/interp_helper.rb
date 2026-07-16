module Tcl
  module InterpHelper
    def self.included(klass)
      klass.class_eval do
        attr_reader :interp
      end
    end

    def _(*args)
      interp.array_to_list(args)
    end

    def _!(*args)
      interp.eval(_(*args))
    end

    def method_missing(name, ...)
      interp.respond_to?(name) ? interp.send(name, ...) : super
    end

    def respond_to_missing?(name, include_private = false)
      interp.respond_to?(name) || super
    end
  end
end
