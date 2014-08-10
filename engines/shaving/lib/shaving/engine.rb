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

    initializer :append_migrations do |app|
      unless app.root.to_s.match root.to_s
        config.paths["db/migrate"].expanded.each do |expanded_path|
          app.config.paths["db/migrate"] << expanded_path
        end
      end
    end
  end
end
