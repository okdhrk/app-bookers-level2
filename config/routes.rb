Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top'
  resources :books, only: [:new, :create, :index, :show, :destroy, :edit, :update] do
    resource :favorites, only: [:create, :destroy]
    resources :book_comments, only: [:create, :destroy]
  end

  resources :users, only: [:show, :edit, :update, :index, :new]
  get 'home/about' => 'homes#about',as: 'homes_about'

  resources :users do
      member do
        get :followings, :followers
      end
    end
  resources :follow_relationships, only: [:create, :destroy,]

  get 'followings_user' => 'users#followings'
  get 'followers_user' => 'users#followers'

end
