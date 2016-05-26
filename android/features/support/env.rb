$LOAD_PATH.unshift *Dir.glob(File.expand_path('features'))
require 'calabash-android/cucumber'
require 'som/movie_fone'

Before do
  @app = MovieFone.new(self)
end