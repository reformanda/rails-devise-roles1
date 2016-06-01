Warbler::Config.new do |config|
  config.webxml.rails.env = ENV['RAILS_ENV'] || 'production'

  config.dirs = %w(app db config lib log public vendor bin)

  config.includes = FileList["Rakefile", ".env"]

  config.bundle_without = []

  config.java_libs += FileList['vendor/*.jar']

end
