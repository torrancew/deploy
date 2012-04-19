require 'helper'

module Deploy

  class TestCommandContextWith < UnitTest

    def test_fails_when_not_passing_a_block
      assert_raises ArgumentError do
        CommandContext::With.new({test: :hash})
      end
    end

    def test_fails_if_not_passing_a_hash
      assert_raises ArgumentError do
        CommandContext::With.new({test: :hash})
      end
    end

  end

end
