require 'ffffound_parser/errors'
require 'ffffound_parser/image_builder'
require 'ffffound_parser/image'
require 'ffffound_parser/parser'
require 'ffffound_parser/version'

module FfffoundParser
  def self.parse(page_number)
    Parser.new(page_number).call
  end
end
