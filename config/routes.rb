Rails.application.routes.draw do
  root 'home#index'
  get 'home/index'
  resources :rss_articles, only: %i[index destroy]
  resources :rss_sources
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
