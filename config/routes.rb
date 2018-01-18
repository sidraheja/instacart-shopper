Rails.application.routes.draw do
  get 'home/index'

	  namespace :api do
    namespace :v1 do
      resources :shoppers, param: :id
      resources :shoppers, param: :email, constraints: { email: /[0-z\.]+/ }
      resources :applicants
    end
  end
	
	mount_ember_app :frontend, to: "/"
	get '*path', to: 'home#index'
end
