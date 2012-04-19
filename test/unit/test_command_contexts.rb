require 'helper'


module Deploy

  class TextCommandContexts < UnitTest

    def setup
      ::Object.const_set :TestClass, Class.new
      ::TestClass.send :include, CommandContexts
      @obj = ::TestClass.new
    end

    def teardown
      ::Object.send :remove_const, :TestClass
    end

    def test_command_contexts_mixin_provides_an_in_method
      assert @obj.respond_to?(:in)
    end

    def test_command_contexts_mixin_provides_an_in_method_which_takes_one_argument_returning_a_command_context
      assert @obj.in('/directory', &lambda { }).is_a?(CommandContext::In)
    end

  end

end
