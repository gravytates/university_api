require_relative 'boot'

require "rails"
require 'jwt'
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
require "action_cable/engine"


module UniversityApi
  class Application < Rails::Application
    config.load_defaults 5.1
    config.autoload_paths << Rails.root.join('lib')


    config.api_only = true
  end
end
