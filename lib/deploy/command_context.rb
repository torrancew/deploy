module Deploy

  # 
  # CommandContext is a factory class, given a :type
  # and some arguments, it will determine the correct
  # command context and reutrn the result.
  #
  # It is my intention that more complex cases such as :as
  # (a given user) the CommandContext will be able to determine
  # whether a password is given (for example) or if the user
  # has already authorized sudo, if sudo is disabled, etc
  # and we will be able to reutrn a CommandContextSudoWithGivenPassword
  # or perhaps a CommandContextSudoWithPromptResponder
  #
  class CommandContext

    def self.new(type, *args, &block)
      @type = type.to_sym
      return appropriate_subclass.new(args, &block)
    end

    private

      def self.appropriate_subclass
        # TODO: Test me for the argument error condition
        unless [:in].include?(@type.to_sym)
          raise ArgumentError, "Type must be one of [:in]"
        end
        return CommandContext::In
      end

  end

end
