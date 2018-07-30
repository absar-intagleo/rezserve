Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # root 'home#index'
  resources :home
  namespace :api do
  	namespace :v1 do
  		namespace :authentication do
        resources :users, only: :create do
          collection do
            post :signin
          end
        end
  		end
      namespace :property do
      end
      namespace :consumer do
      end
    end
  end
	post 'signup' => 'api/v1/authentication/users#create'
  post 'signin' => 'api/v1/authentication/users#signin'
  post 'update_user' => 'api/v1/authentication/users#update'
  post 'property_static_data' => 'api/v1/consumer/properties#new'
  post 'create_property' => 'api/v1/consumer/properties#new'
end
