require 'ffffound_parser/version'
require 'ffffound_parser/link'
require 'nokogiri'
require 'open-uri'

module FoundParser
  module_function

  def parse(page_number, **kwargs)
    parsed_page = []
    date_range = (kwargs[:start_date]..kwargs[:end_date]).to_a
    doc = Nokogiri::HTML(open("#{self::FFFFOUND_LINK}#{page_number * 25}"))
    doc.css('blockquote.asset').each do |block|
      block.css('.description').map { |node| node.children.map(&:text) }.flatten.each do |item|
        string_date = (item.squish if date_range.any? { |d| item.include?(d.to_s) }) || ''
      end
      if string_date.match('(\s?(\d+)\s(hours|minutes|days))+\s(ago)').present?
        string_date = string_time_to_object(string_date.scan(/(\d+\s\w+)/i).flatten)
        date =  (DateTime.now - string_date.seconds).to_datetime
      else
        date = string_date.to_datetime
      end
      image_src = block.css("a img[@id*='asset']")[0] || ''
      parsed_page << { link: image_src, posted_at: date }
    end
    parsed_page
  end

  def string_date()
  end

  def string_time_to_object(times)
    sum = 0
    times.each do |time|
      obj = time.split(' ')
      num = obj[0].to_i
      sum += num.send(obj[1])
    end
    sum
  end
end
