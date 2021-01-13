Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  namespace :api, defaults: { format: 'json' } do
    namespace :v1 do
      mount_devise_token_auth_for 'User', at: 'auth'
      resources :export_csv, only: %i[index create]
      # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
    end
  end
end
