Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root "home#index"

  namespace :api do
    namespace :v1 do
      resources :volcanoes
    end
  end


  devise_scope :user do
    get '/users/sign_out', to: 'devise/sessions#destroy'
  end

  
end

