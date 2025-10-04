Rails.application.routes.draw do
  devise_for :users
  get 'posts/new'
  get 'posts/index'
  get 'posts/show'
  get 'posts/edit'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: "homes#top"
  get '/homes/about' => 'homes#about', as: 'about'

end
 