Rails.application.routes.draw do
  get '/' => "homes#top"
  get 'test' => "tests#index"
  get 'map' => "maps#index"

  resources :show_pdf, only: :index

  resources :rooms do
    collection do
      get 'searches/area'
      get 'searches/keyword'
    end
  end

  post 'reservation/confirm' => 'reservation#confirm'
  post 'reservation' => 'reservation#create'
  get 'reservation' => 'reservation#index'
  get 'reservation/show' => 'reservation#show'

  devise_for :users, :controllers => {
    :registrations => 'users/registrations'
  }
  get 'user' => 'users#account'
  get 'user/:id' => 'users#profile'
  patch 'user/:id' => 'users#update'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
