require 'ffffound_parser/version'
require 'ffffound_parser/parser'

module FfffoundParser
  class PageNumberError < StandardError; end

  def self.find(page_number)
    fail PageNumberError, 'Page number is invalid' unless page_number_valid?(page_number)
    Parser.new(page_number)
  end

  private

  def self.page_number_valid?(page_number)
    page_number > 0 && page_number.is_a?(Integer)
  end
end
