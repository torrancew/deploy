require 'ansi/code'
module Deploy
  module Formatters
    #
    # A simple formatter
    #
    #
    class Simple
      def initialize(io)
        @io = io
      end

      def print(string)
        @io.print(green(string))
      end

      def green(string)
        ::ANSI::Code.green { string }
      end

      def bold(string)
        ::ANSI::Code.bold { string }
      end
    end
  end
end
Deploy::Suite.output = Deploy::Formatters::Simple.new(Deploy::Suite.output)
