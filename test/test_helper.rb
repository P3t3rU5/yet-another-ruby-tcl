require 'test/unit'
require_relative '../lib/tcl'

module Tcl
  class Interp
    def clear!
      procs.each { |p| _! :rename, p, '' }
      vars.each  { |v| _! :unset, v }
    end
  end
end

module Test
  module Unit
    class TestCase
      def path_to_fixture(*path_pieces)
        File.join(File.dirname(__FILE__), 'fixtures', *path_pieces)
      end
    end
  end
end
