Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      devise_scope :api_v1_user do
        post 'users/register', to: 'registrations#create'
      end
    end
  end
end
