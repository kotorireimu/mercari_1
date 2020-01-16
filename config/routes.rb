Rails.application.routes.draw do

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    passwords: 'users/passwords',
    registrations: 'users/registrations',
    confirmations: 'users/confirmations',
    omniauth_callbacks:  "users/omniauth_callbacks" 
  }
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  devise_scope :user do
    get 'address', to: 'users/registrations#address'
    post 'address', to: 'users/registrations#address'
    get 'phone', to: 'users/registrations#phone'
    post 'phone', to: 'users/registrations#phone'
    get 'select', to: 'users/registrations#select'
  end
  resources :users do
    resources :card, only: [:new, :show] do
      collection do
        post 'new', to: 'card#new'
        post 'show', to: 'card#show'
        post 'pay', to: 'card#pay'
        post 'delete', to: 'card#delete'
        post 'confirm', to: 'card#confirm'
        
      end
    end
  end

  resources :buy, only: [:index] do
    collection do
      get 'index', to: 'buy#index'
      post 'pay', to: 'buy#pay'
      get 'done', to: 'buy#done'
    end
  end


  get 'toppage/index'
  get 'homes/index'
  get 'homes/destroy'
  get 'homes/edit' 
  get 'details/index'
  get 'homes/identification'

  
  get 'items/index'

  get 'buy/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  root 'toppage#index'
  resources :items, except: :show
  resources :homes, except: :show

  resources :toppage, except: :show
  resources :details, except: :show
  
  
  
  root 'homes#index'
  resources :edit, except: :show
  resources :identification, except: :show
  resources :destroy, except: :show

end 

