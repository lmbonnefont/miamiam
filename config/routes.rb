Rails.application.routes.draw do
  get 'semaines/nbjours'
  post 'semaines/savenbjours'
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :semaines, only: [:new, :create, :show] do
    resources :listedecourses, only: [:show]
  end
  resources :recettes, only: [:show, :index]
end
