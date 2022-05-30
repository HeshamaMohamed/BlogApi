Rails.application.routes.draw do
  # devise_for :users
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      devise_scope :api_v1_user do
        post 'users/register', to: 'registrations#create'
        post 'users/login', to: 'sessions#create'
      end
      resources :posts, only: %i[index show create update destroy]
    end
  end
end
