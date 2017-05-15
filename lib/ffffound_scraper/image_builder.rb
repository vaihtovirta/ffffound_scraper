module FfffoundScaper
  class ImageBuilder
    DATE_NUMBERS_REGEXP = /(\d+\s\w+)/i
    DATE_WORD_REGEXP = /(\s?(\d+)\s(hours|minutes|days))+\s(ago)/

    attr_reader :nodes
    private :nodes

    def initialize(block)
      @nodes = block.css('.description')
    end

    def call
      return unless nodes

      FfffoundScaper::Image.new(image_src, decorated_date)
    end

    private

    def date
      info[1]
    end

    def decorated_date
      date.match(DATE_WORD_REGEXP) ? words_to_date(date.scan(DATE_NUMBERS_REGEXP).flatten) : date
    end

    def image_src
      info[0]
    end

    def info
      @info ||= nodes.map { |node| node.children.map(&:text) }
                     .flatten
                     .reject(&:empty?)
                     .map(&:strip)
    end

    def words_to_date(words)
      words.each_slice(2) { |num, word| Time.now - num.send(word) }
    end
  end
end
