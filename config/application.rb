require_relative 'boot'

require 'rails/all'

Bundler.require(*Rails.groups)

module RubyNaitei2019Bootshop
  class Application < Rails::Application
    config.load_defaults 5.1
    config.active_job.queue_adapter = :sidekiq
  end
end
