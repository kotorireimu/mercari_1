Rails.application.routes.draw do
  get 'homes/index'
  get 'items/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "homes#index"
end
