module Deploy

  module CommandContexts

    def in(directory, &block)
      CommandContext.new(:in, directory, &block)
    end

  end

end
