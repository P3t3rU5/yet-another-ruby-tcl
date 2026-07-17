# frozen_string_literal: true

module Tcl
  module Utils
    def _(*args)
      interp.array_to_list(args)
    end

    def _!(*args)
      interp.eval(_(*args))
    end
  end
end
