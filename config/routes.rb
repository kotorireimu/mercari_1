Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    passwords: 'users/passwords',
    registrations: 'users/registrations',
    confirmations: 'users/confirmations'
    }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  devise_scope :user do
    post 'users/profile' => 'users/registrations#profile'
    post 'users/phone' => 'users/registrations#phone'
      
    root to: "users/registrations#new"
  end
  resources :users 
end
