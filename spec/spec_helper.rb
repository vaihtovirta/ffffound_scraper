$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'ffffound_scraper'
require 'vcr'

VCR.configure do |config|
  config.cassette_library_dir = 'spec/fixtures/vcr_cassettes'
  config.default_cassette_options = { record: :new_episodes }
  config.hook_into :webmock
end
