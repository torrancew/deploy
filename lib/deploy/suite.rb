module Deploy
  class Suite
    include Stages
    include ServerRoles

    def initialize(backend)
      @backend = backend
      @dispatch = Dispatch.new
      enqueue
    end

    def enqueue
      stages.each { |stage| send stage }
    end

    def on(role, cmd)
      @dispatch << @backend.send(:new, role, cmd)
    end

    def run
      @dispatch.work
    end

    @@io = $stdout

    def self.output
      @@io
    end

    def self.output=(stream)
      @@io = stream
    end
  end
end
