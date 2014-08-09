require 'haml-rails'

require 'bower-rails'

require 'sass'
require 'bootstrap-sass'

module Shaving
  class Engine < ::Rails::Engine
    isolate_namespace Shaving

    config.generators do |g|
      g.fixture_replacement :factory_girl, :dir => 'test/factories'
    end
  end
end
