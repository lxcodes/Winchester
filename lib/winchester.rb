# encoding: utf-8
require 'celluloid'

require_relative 'winchester/util'

FETCH_INTERVAL = 5

module Winchester
  DEFAULTS = {
    poll_interval: 5
  }

  def self.options
    @options ||= DEFAULTS.dup
  end

  def self.options=(opts)
    @options = opts
  end
end
