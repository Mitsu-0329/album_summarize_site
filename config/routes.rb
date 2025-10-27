Rails.application.routes.draw do
  namespace :admin do
    get 'comments/index'
  end
  namespace :admin do
    get 'users/index'
    get 'users/show'
  end
  devise_for :admins, path: "admin", controllers: {
    sessions: 'admin/admins/sessions'
  }

  namespace :admin do
    root "users#index"
    resources :users, only: [:index, :show, :destroy]
    resources :comments, only: [:index, :destroy]
    delete "comments/:id/destroy_all", to: "comments#destroy_all"
    resources :genres
  end

  devise_for :users

  scope module: :public do
    root to: "homes#top"
    get '/homes/about' => 'homes#about', as: 'about'
    resources :posts, only: [:new, :create, :index, :show, :edit, :update, :destroy] do
      resources :post_comments, only: [:create]
    end
    resources :users, only: [:edit, :update, :show, :destroy]
    resources :genres, only: [:index, :edit]
  end
end
 