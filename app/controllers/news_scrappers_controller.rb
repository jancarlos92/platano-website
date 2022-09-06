class NewsScrappersController < ApplicationController
  def index
  end

  def new
      Web.crawl!
  end

  def scrape

      url = 'https://apnews.com/hub/puerto-rico'
      response = Web.process(url)
  if response[:status] == :completed && response[:error].nil?

      flash.now[:notice] = "Successfully scraped url"
        byebug
  else

      flash.now[:alert] = response[:error]
     byebug
  end

    rescue StandardError => e

        flash.now[:alert] = "Error: #{e}"
        byebug
   end




end
