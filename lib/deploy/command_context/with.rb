module Deploy

  class CommandContext

    class With

      #
      # Wraps commands in a sub-shell and soft-exports the given env
      # variables to the shell (as a command prefix, without `export`)
      # the sub-shell contains the variables, such that the following
      # would print nothing:
      #
      # run("export TEST=first")
      # with({test: "Greeting"}) do
      #  puts capture_stdout("echo $TEST")
      # end
      # puts capture_stdout("echo $TEST")
      #
      # would output "Test", "First" - as the override only applies
      # to the given block.
      #
      # For more information about how this works, see:
      #
      #  * http://tldp.org/LDP/abs/html/subshells.html
      #
      # @author Lee Hambley
      #
      def initialize(*args, &block)
    
        raise ArgumentError, "Expected a block" unless block_given?
        raise ArgumentError, "Args must be Hash" unless args.first.is_a?(Hash)

        @environment = args.first

      end

    end

  end

end
