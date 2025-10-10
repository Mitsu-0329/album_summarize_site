Rails.application.routes.draw do
  get 'genres/index'
  get 'genres/edit'
  devise_for :users

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :posts, only: [:new, :create, :index, :show, :edit, :update, :destroy]


  root to: "homes#top"
  get '/homes/about' => 'homes#about', as: 'about'

end
 