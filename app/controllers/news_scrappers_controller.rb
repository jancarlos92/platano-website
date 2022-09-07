class NewsScrappersController < ApplicationController
  def index
      @articles = Article.all
  end

  def new
      Web.crawl!
  end

  def scrape

      url = 'https://apnews.com/hub/puerto-rico'

      response = Web.process(url)

      render "news_scrappers#scrape"

  end

  # if response[:status] == :completed && response[:error].nil?
  #
  #     flash.now[:notice] = "Successfully scraped url"
  #
  #
  # else
  #     flash.now[:alert] = response[:error]
  #
  # end
  #
  #   rescue StandardError => e
  #       flash.now[:alert] = "Error: #{e}"
  #
  #  end




end
