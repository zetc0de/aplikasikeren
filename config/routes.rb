Rails.application.routes.draw do
    post 'user/signin' => 'user_token#create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
	get 'users', to: 'users#index'
	get 'user', to: 'users#show'
	post 'user/create', to: 'users#create'
end

