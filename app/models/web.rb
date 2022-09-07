require 'Article'

class Web < Kimurai::Base



    @name = "web_scrapper_spider"
    @engine = :mechanize
  #   @start_urls = ["https://metaruby.com/"]
  #   @config = {
  #   user_agent: "Chrome/68.0.3440.84"
  # }

  def self.process(url)
    @start_urls = [url]
    self.crawl!
  end
# def parse(response, url:, data: { })
#   blogs = []
#   response.xpath("//table[@class='topic-list']//tbody//tr").each do |tr|
#     scrapped_data = {
#                       title: tr.at('td[1]//span').text,
#                       category: tr.at('td[1]//div//span').text,
#                       date: tr.at('td[3]').text.strip
#                     }
#     blogs << scrapped_data
#     save_to "results.json", scrapped_data.as_json, format: :json
#   end
# end

def parse(response, url:, data: {})


    #response.css('article').css("//div[@class='FeedCard urn:publicid:ap.org:dbd877b9babbc260f673e60f5d2c66fc Component-wireStory-0-2-89']")
    # Component-headline-0-2-99
    #
    # '[@class="Component-headline-0-2-99"]'

articlesfeed = response.css('article').css('a')

numberofheadlines = articlesfeed.length


while numberofheadlines > 50

headline = articlesfeed.first(2)

headline.each do |headline|
    a = Article.new(headline.text, headline.text)

    a.save

end

articlesfeed.shift()

articlesfeed.shift()


end
    #  articlesfeed.each do |article|






    # item = Hash.new
    #
    #  item[:headline] = article.text
    #  item[:content] = article.text
     # item[:content] = article[0].text

     # item[:subheadline] = article[1].text
    # item[:price]      = article.css('span.listing-row__price')&.text&.squish&.delete('^0-9').to_i
    # item[:stock_type] = article.css('div.listing-row__stocktype')&.text&.squish
    # item[:miles]      = article.css('span.listing-row__mileage')&.text&.squish&.delete('^0-9').to_i
    # item[:exterior_color] = article.css('ul.listing-row__meta li')[0]&.text&.squish.gsub('Ext. Color: ', '')
    # item[:interior_color] = article.css('ul.listing-row__meta li')[1]&.text&.squish.gsub('Int. Color: ', '')
    # item[:transmission] = article.css('ul.listing-row__meta li')[2]&.text&.squish.gsub('Transmission: ', '')
    # item[:drivetrain]   = article.css('ul.listing-row__meta li')[3]&.text&.squish.gsub('Drivetrain: ', '')
    #
     # Article.where(item).first_or_create


  #end
end
end
