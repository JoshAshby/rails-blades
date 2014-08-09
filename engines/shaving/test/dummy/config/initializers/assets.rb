# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
# Rails.application.config.assets.precompile += %w( search.js )


BowerRails.configure do |bower_rails|
  # Tell bower-rails what path should be considered as root. Defaults to Dir.pwd
  # bower_rails.root_path = Dir.pwd

  # Invokes rake bower:install before precompilation. Defaults to false
   bower_rails.install_before_precompile = true

  # Invokes rake bower:resolve before precompilation. Defaults to false
   bower_rails.resolve_before_precompile = true

  # Invokes rake bower:clean before precompilation. Defaults to false
   bower_rails.clean_before_precompile = true
end
