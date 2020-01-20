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

  get 'details/index'
  get 'items/index'
  get 'buy/index'

  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  root 'toppage#index'

  resources :items, except: :show
 
  resources :toppage, except: :show
  resources :details, except: :show
  
  resources :images do
    member do
      get 'show_image'
    end
  end

  resources :homes, except: [:show, :edit] do
    collection do
      get 'prof', to: "homes#prof"
      get 'logout', to: "homes#destroy"
      get 'identification', to: "homes#identification"
      get 'card', to: "homes#card"
      get 'exhibition', to: "homes#exhibition"
    end
  end
  
  resources :items do
    collection do
      get 'get_category_children', defaults: { format: 'json' }
      get 'get_category_grandchildren', defaults: { format: 'json' }
    end
  end


  

  resources :toppage, except: :show
  resources :details, except: :show

  resources :edit, except: :show
  resources :identification, except: :show
  resources :destroy, except: :show

  root 'dateils#index'
  resources :details
end 

