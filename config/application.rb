require_relative "boot"

require "rails/all"


# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)
require_relative "../lib/tasks/middlewares/access_token_middleware.rb"

module CabSystem
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.0
    config.hosts.clear
    config.active_job.queue_name_prefix = Rails.env
    config.autoload_paths << Rails.root.join('lib')
    config.autoload_paths << Rails.root.join('lib','tasks','middlewares')
    config.autoload_paths <<  Rails.root.join('workers')
    config.eager_load_paths <<  Rails.root.join('workers')
    config.middleware.use Middlewares::AccessTokenMiddleware
    config.active_job.queue_adapter = :sidekiq
    # Configuration for the application, engines, and railties goes here.
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")

    # Only loads a smaller set of middleware suitable for API only apps.
    # Middleware like session, flash, cookies can be added back manually.
    # Skip views, helpers and assets when generating a new resource.
    config.api_only = false

    ENV['RABBITMQ_URL'] = 'amqp://kaushik:123@localhost:5672'
  end
end
