require 'nokogiri'
require 'open-uri'

module FfffoundParser
  class Parser
    extend Forwardable

    BLOCKQUOTE_CSS = 'blockquote.asset'.freeze
    URL = 'http://ffffound.com/?offset='.freeze

    attr_reader :document
    private :document

    def_delegator :document, :css

    def initialize(page_number = 1)
      raise PageNumberError, 'Page number is invalid' unless page_number.to_i > 0

      @document = Nokogiri::HTML(open("#{URL}#{page_number.to_i * 25}").read)
    end

    def call
      css(BLOCKQUOTE_CSS).map { |block| ImageBuilder.new(block).call }
    end
  end
end
