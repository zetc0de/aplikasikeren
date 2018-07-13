Rails.application.routes.draw do
    post 'user/signin' => 'user_token#create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
	get 'users', to: 'users#index'
	get 'user', to: 'users#show'
	post 'user/create', to: 'users#create'
	put 'user/update', to: 'users#update'
	delete 'user/delete', to: 'users#destroy'

	get 'posts', to: 'posts#index'
	post 'post', to: 'posts#create'
	get 'post/:id', to: 'post#show'
end

