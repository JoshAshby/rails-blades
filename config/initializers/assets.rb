# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
Rails.application.config.assets.precompile << Proc.new do |path|
  if path =~ /\.(css|js)\z/

    full_path = Rails.application.assets.resolve(path).to_path
    app_assets_path = Rails.root.join('app', 'assets').to_path

    if full_path.starts_with? app_assets_path
      true
    else
      false
    end
  else
    false
  end
end

Rails.application.config.assets.paths << Rails.root.join('vendor', 'assets', 'bower_components')
