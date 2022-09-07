Rails.application.routes.draw do


    resources :news_scrappers do
    match '/scrape', to: 'news_scrappers#scrape', via: :post, on: :collection
  end

  root to: "news_scrappers#scrape"
 end
