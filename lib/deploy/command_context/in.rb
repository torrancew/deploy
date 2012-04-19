module Deploy
  class CommandContext
    class In

      #
      # Initializes a new "In" (Directory) [CommandContext] the new 
      #
      #
      def initialize(*args, &block)
        
        unless block_given?
          raise ArgumentError, "Expected a block for CommandContext::In.new(). Called from #{caller.first}"
        end

        if args.length > 1
          warn "Warning too many arguments to CommandContext::In.new(). #{args.length - 1} ignored. Called from: #{caller.first}."
        end

        @block     = block
        @directory = args.first

      end

      #
      # 
      # 
      # @return [String] the shell command to prefix to the result of the given block
      #
      # @author Lee Hambley
      #
      def command_prefix
        prefix_pattern % @directory
      end

      #
      # @return [String] the shell command to  to the result of the given block
      #
      # @author Lee Hambley
      #
      def command_suffix
        "; else; echo \"#{error_message}\"; false; fi"
      end

      private

        def prefix_pattern
          "if [ -d \"%s\" ]; then "
        end

        def error_message
          "The directory \"#{@directory}\" does not exist, no operations may be performed in a non-existent directory." +
          "\n" +
          "This command will now terminate the operation by returning false (man (1) false)"
        end

    end
  end
end
