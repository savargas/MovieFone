# aapt dump badging *.apk

ENV['MAIN_ACTIVITY']='com.aol.mobile.moviefone.activities.IntroductionActivity'
ENV['APP_PATH']='app/Moviefone-Android-debug-3.0.1.334.apk'
ENV['TEST_APP_PATH']='test_servers/dc2268310e0461a3012238f91f8fb57c_0.5.14.apk'

require 'calabash-android/operations'
extend Calabash::Android::Operations

# queries like: all
require 'testmunk/calabash/utils/query'
extend Testmunk::Utils::Query
require 'testmunk/calabash/android/screens/views/views'
extend Testmunk::Android::Views

require 'awesome_print'
AwesomePrint.irb!

$LOAD_PATH.unshift *Dir.glob(File.expand_path('features'))
require 'som/movie_fone'

@app = MovieFone.new(self)