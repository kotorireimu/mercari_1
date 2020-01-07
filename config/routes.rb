Rails.application.routes.draw do
  # get 'toppage/index'
  # get 'homes/index'
  get 'homes/destroy'
  get 'homes/edit'
  get 'homes/identification'
  devise_for :users
  # get 'items/index'
  get 'buy/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'toppage#index'
  resources :items, except: :show
  resources :homes, except: :show
  # resources :toppage, except: :show
end
