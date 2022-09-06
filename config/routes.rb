Rails.application.routes.draw do


    resources :news_scrappers_controller do
    match '/scrape', to: 'web#scrape', via: :post, on: :collection
  end

  root to: "news_scrappers_controller#index"
 end
