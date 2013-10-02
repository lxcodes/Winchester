module Winchester
  class Fetcher
    include Celluloid

    def fetch
      puts 'Fetching jobs...'
    end

    def fetch_interval
      Winchester.options[:poll_interval] || FETCH_INTERVAL
    end
  end
end
