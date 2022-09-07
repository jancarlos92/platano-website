class Article < ApplicationRecord

    attr_accessor :headline, :content

    def initialize(headline)
        @headline = headline
    
      end

end
