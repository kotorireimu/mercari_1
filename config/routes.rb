Rails.application.routes.draw do
  get 'toppage/index'
  get 'homes/index'
  devise_for :users
  get 'items/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'toppage#index'
  resources :items, except: :show
  resources :homes, except: :show
  resources :toppage, except: :show
end
