require 'helper'

module Deploy
  class TestCommand < UnitTest

    def test_execute_returns_command
      c = Command.new('test')
      assert_equal 'test', c.execute
    end

    def test_commands_properly_shell_escape_themselves
      skip "Thinking out loud, I hope Net::SSH handles this"
      c = Command.new(%|echo "-e 'puts \"Hello World\"'" \| $(which ruby)|)
      assert_equal 'echo "e- \'puts \"Hello World\"\' | $(which ruby)', c.execute
    end

  end
end
