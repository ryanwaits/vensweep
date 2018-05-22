Rails.application.routes.draw do
  root to: 'dashboard#index'
  get 'dashboard', to: 'dashboard#index'
  post 'search', to: 'dashboard#search'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
