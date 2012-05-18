module Deploy
  class TestBackend
    def initialize(role,command)
      @role = role
      @command = Command.new(command)
      @output = Deploy::Suite.output
    end

    def execute
      @role.channels.each do |channel|
        @output.print "#{@role.name}@#{channel}> #{@command.execute}\n"
      end
    end
  end
end
