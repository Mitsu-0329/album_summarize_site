Rails.application.routes.draw do
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
    resources :post_comments, only: [:index, :destroy]
    delete "post_comments/:post_id/destroy_all" => "post_comments#destroy_all"
    resources :genres, only: [:create, :index, :edit, :update, :destroy]
  end

  devise_for :users

  scope module: :public do
    root to: "homes#top"
    get '/homes/about' => 'homes#about', as: 'about'
    resources :posts, only: [:new, :create, :index, :show, :edit, :update, :destroy] do
      resource :favorite, only: [:create, :destroy]
      resources :post_comments, only: [:create, :destroy]
    end
    resources :users, only: [:edit, :update, :show, :destroy]
    resources :genres, only: [:create, :index, :edit, :update, :destroy]
    get '/search', to: 'searches#search'
    get 'photo_albums/index'
    get 'photo_albums/show'
  end
end
 