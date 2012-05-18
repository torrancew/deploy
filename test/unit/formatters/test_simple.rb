require 'helper'
require_relative '../../../lib/deploy/formatters/simple'

module Deploy
  module Formatters
    class TestSimple < UnitTest

      def setup
        @stream = mock
        @simple = Simple.new(@stream)
      end

      def test_print_delegates_to_io
        @simple.expects(:green).with('test').returns('green test')
        @stream.expects(:print).with('green test')
        @simple.print('test')
      end

      def teardown
        Deploy::Suite.output = $stdout
      end
    end
  end
end
