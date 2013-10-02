module Winchester
  class Launcher
    include Celluloid
    include Winchester::Util

    trap_exit :actor_died

    def initialize
      @fetcher = Winchester::Fetcher.new_link
    end

    def actor_died(actor, reason)
      handle_exception reason
      exit 1
    end

    def run
      require 'timers'

      timers = Timers.new
      every_five_seconds = timers.every(@fetcher.fetch_interval) { @fetcher.fetch }

      loop { timers.wait }
    end
  end
end
