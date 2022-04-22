Rails.application.routes.draw do
  get "/" => "rooms#top"

  resources :rooms

  devise_for :users, :controllers => {
    :registrations => 'users/registrations'
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
