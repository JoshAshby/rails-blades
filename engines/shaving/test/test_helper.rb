# Configure Rails Environment
ENV["RAILS_ENV"] = "test"

require File.expand_path("../dummy/config/environment.rb",  __FILE__)
require "rails/test_help"
require 'factory_girl_rails'

FactoryGirl.definition_file_paths = [File.expand_path("../factories/", __FILE__)]
FactoryGirl.find_definitions

Rails.backtrace_cleaner.remove_silencers!

# Load support files
Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each { |f| require f }

class ActiveSupport::TestCase
  include FactoryGirl::Syntax::Methods

  setup do
    @routes = Shaving::Engine.routes
  end
end
