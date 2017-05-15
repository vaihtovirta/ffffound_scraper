require 'ffffound_scraper/errors'
require 'ffffound_scraper/image_builder'
require 'ffffound_scraper/image'
require 'ffffound_scraper/scraper'
require 'ffffound_scraper/version'

module FfffoundScaper
  def self.call(page_number)
    Scraper.new(page_number).call
  end
end
