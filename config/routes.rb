Zuxia::Application.routes.draw do


  resources :reports, :only => [:new, :show, :create, :destroy]
  resources :books, :only=>[:new, :create, :destroy,:update,:index]
  resources :users 

  resources :sessions, :only => [:new, :create, :destroy]
  
  match '/signin', :to => 'sessions#new'
  match '/signout', :to => 'sessions#destroy'
  match '/signup', :to=> 'users#new'
  root :to => 'pages#home'


end
