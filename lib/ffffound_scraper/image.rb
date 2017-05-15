module FfffoundScaper
  class Image
    attr_reader :link, :posted_at

    def initialize(link, posted_at)
      @link = link
      @posted_at = posted_at
    end
  end
end
