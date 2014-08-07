module Shaving
  class Engine < ::Rails::Engine
    isolate_namespace Shaving

    initializer :assets do |config|
      Rails.application.config.assets.paths << root.join("app/assets")
    end
  end
end
