Rails.application.routes.draw do
  get 'homes/index'
  get 'homes/destroy'
  get 'homes/edit' 
  get 'details/index'
  devise_for :users
  get 'items/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'details#index'
  
  resources :items, except: :show
  resources :homes, except: :show

end
