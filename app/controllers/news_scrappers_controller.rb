class NewsScrappersController < ApplicationController
  def index
      url = 'https://apnews.com/hub/puerto-rico'

      response = Web.process(url)

      @articles = Article.all

      DeleteOldArticlesJob.perform_in(10.minutes, @articles)

  end

  def new
      Web.crawl!
  end

  def scrape

      url = 'https://apnews.com/hub/puerto-rico'

      response = Web.process(url)


      render "news_scrappers#scrape"

  end

  def create

       @newsupporter = Supporter.new(email: params.require(:email))

       if @newsupporter.save


           SupporterMailer.with(supporter: @newsupporter).welcome_email.deliver_now

           flash[:success] = "Thank You So Much!"

           redirect_back(fallback_location: root_path)

       else
          redirect_back(fallback_location: root_path)
       end
  end



end
