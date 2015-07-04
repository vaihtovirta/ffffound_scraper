require 'nokogiri'
require 'open-uri'

module FfffoundParser
  class Parser
    SITE_LINK = 'http://ffffound.com/?offset='
    DATE_WORD_REGEXP = /(\s?(\d+)\s(hours|minutes|days))+\s(ago)/
    DATE_NUMBERS_REGEXP = /(\d+\s\w+)/i

    attr_reader :image_list

    def initialize(page_number = 1)
      @page_number = page_number
      Struct.new('Image', :link, :posted_at)
      @image_list = parse(target_page)
    end

    private

    def parse(page)
      page.css('blockquote.asset').map do |block|
        info = info(block.css('.description'))
        image_src = info[0]
        date = info[1]
        date = date_decorate(date)
        Struct::Image.new(image_src, date)
      end
    end

    def date_decorate(date)
      date.match(DATE_WORD_REGEXP) ? words_to_date(date.scan(DATE_NUMBERS_REGEXP).flatten) : date
    end

    def info(nodes)
      return unless nodes
      nodes.map { |node| node.children.map(&:text) }
        .flatten
        .reject(&:empty?)
        .map(&:strip)
    end

    def words_to_date(words)
      words.each_slice(2) do |num, word|
        Time.now - num.send(word)
      end
    end

    def target_page
      Nokogiri::HTML(open("#{SITE_LINK}#{@page_number * 25}"))
    end
  end
end
