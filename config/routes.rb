Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "pages#home"
  get 'about', to: 'pages#about'
  # resources :articles, only: [:show, :index, :new, :create, :edit, :update] #the only statment is for specifing only one route
  resources :articles #this is showing all the liste provided by rails routes --expended
  get 'signup', to: 'users#new'
  # post  'users', to: 'users#create' replaced with a more general instruction:
  resources :users, except: [:new]
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
end
