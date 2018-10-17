Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :semaines, only: [:new, :create, :show] do
    resources :listedecourses, only: [:show]
    get 'nbjours'
    post 'savenbjours'
  end
  resources :recettes, only: [:show, :index]
end
