Rails.application.config.assets.precompile << Proc.new do |path|
  if path =~ /\.(css|js)\z/
    full_path = Rails.application.assets.resolve(path).to_path
    app_assets_path = File.expand_path File.join(File.dirname(__FILE__),
                                                 '../../',
                                                 'app', 'assets')

    if full_path.starts_with? app_assets_path
      true
    else
      false
    end
  else
    false
  end
end
