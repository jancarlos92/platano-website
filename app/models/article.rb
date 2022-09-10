class Article < ApplicationRecord

    attr_accessor :headline, :content

    validates :headline, uniqueness: true
    validates :content, uniqueness: true


end
