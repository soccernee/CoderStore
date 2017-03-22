Rails.application.routes.draw do
  mount PostgresqlLoStreamer::Engine => "/product_thumbnail"
  resources :photos
  resources :products

  root to: 'visitors#index'
  devise_for :users
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
