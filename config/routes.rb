Rails.application.routes.draw do

  get 'users/new'

	root 'static_pages#home'

  get '/home' ,to:'static_pages#home'

	get '/fave',to:'static_pages#fave'
	get '/myfave',to:'static_pages#myfave'
	get '/ac',to:'static_pages#ac'
	get '/wa',to:'static_pages#wa'

  get '/help',to:'static_pages#help'

	get '/about',to:'static_pages#about'

	get '/mypage',to:'static_pages#mypage'

	get '/contact',to:'static_pages#contact'

	get '/signup',to:'users#new'
	post '/signup',to:'users#create'

	get '/login', to:'sessions#new'
	post '/login',to:'sessions#create'
	delete '/logout',to:'sessions#destroy'

	resources :users
	resources :nazos, only: [:new,:create, :destroy,:show]
	post '/ans',to:'nazos#getans'
	resources :nazos do
		resources :likes, only: [:create, :destroy]
	end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
