require 'singleton'
require 'optparse'

require 'winchester'
require 'winchester/util'

module Winchester
  class CLI
    include Util
    include Singleton

    def initialize
    end

    def parse(args=ARGV)

    end

    def run
      self_read, self_write = IO.pipe

      %w(INT TERM USR1 USR2 TTIN).each do |sig|
        trap sig do
          self_write.puts(sig)
        end
      end

      p "Running in #{RUBY_DESCRIPTION}"
      p 'Starting processing, hit Ctrl-C to stop'

      require 'winchester/launcher'
      @launcher = Winchester::Launcher.new

      begin
        @launcher.run
      rescue Interrupt
        p 'Shutting down'
        # launcher.stop
        # Explicitly exit so busy Processor threads can't block
        # process shutdown.
        exit(0)
      end
    end
  end
end
