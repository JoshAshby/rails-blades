Rails.application.config.assets.precompile << Proc.new do |path|
  if path =~ /\.(css|js)\z/

    full_path = Rails.application.assets.resolve(path).to_path
    app_assets_path = File.expand_path '../../../app/assets', __FILE__

    if full_path.starts_with? app_assets_path
      true
    else
      false
    end
  else
    false
  end
end
