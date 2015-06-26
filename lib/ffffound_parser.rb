require 'nokogiri'
require 'open-uri'

module FfffoundParser
  SITE_LINK = 'http://ffffound.com/?offset='
  DATE_REGEXP = '(\s?(\d+)\s(hours|minutes|days))+\s(ago)'

  class << self
    def parse(page_number)
      doc = Nokogiri::HTML(open("#{SITE_LINK}#{page_number * 25}"))
      doc.css('blockquote.asset').map do |block|
        image_src = info(block.css('.description'))[0]
        date = info(block.css('.description'))[1]
        date = date_decorate(date)
        { link: image_src, posted_at: date }
      end
    end

    def date_decorate(date)
      if date.match(DATE_REGEXP) then
        words_to_date(date.scan(/(\d+\s\w+)/i).flatten)
      else
        date
      end
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
  end
end
