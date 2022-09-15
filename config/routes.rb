Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

resources :news_scrappers

root to: "news_scrappers#index"

end
