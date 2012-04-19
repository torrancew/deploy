require 'helper'

module Deploy
  class TestCommandContextIn < UnitTest
  
    def test_fails_when_not_passing_a_block
      assert_raises ArgumentError, "wrong number of nargs" do
        CommandContext::In.new("/tmp")
      end
    end

    def test_warning_if_passing_too_many_args
      out, err = capture_io do
        CommandContext::In.new(["too"], ["many"], ["arguments"], &lambda { })
      end
      assert_match /too many/, err
      assert_match /2 ignored/, err
      assert_match Regexp.new(__FILE__), err
    end


    def test_returning_the_correct_sub_command_context

      in_context = CommandContext::In.new("/example/directory", &lambda { })

      expected_command_prefix = "if [ -d \"/example/directory\" ]; then "
      expected_command_suffix = /false; fi/

      assert_equal expected_command_prefix, in_context.command_prefix
      assert_match expected_command_suffix, in_context.command_suffix

    end

  end
end

