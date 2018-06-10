Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :breeders
  namespace :api do
    namespace :v1 do
      mount_devise_token_auth_for 'Breeder', at: 'breeder_auth'
      resources :welcome, only: [:index]
      resources :litters, only: [:index, :show, :create]
      resources :breeders, only: [:index, :show]
      resources :animals, only: [:show, :create]
    end
  end
end
