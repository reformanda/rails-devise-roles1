Warbler::Config.new do |config|
  config.webxml.rails.env = 'development'

  config.dirs = %w(app db config lib log public  vendor tmp bin)

  config.includes = FileList["Rakefile"]

  config.bundle_without = []

end
