Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'post_images#index'
  # resouces 以下、resouce手前までの文章が別途必要かもしれない

  resources :post_images, only: [:new, :create, :index, :show] do
    resource :post_comments, only: [:create, :destroy]
  end

  resources :post_images, only: [:new, :create, :index, :show] do
	  resource :favorites, only: [:create, :destroy]
	  resource :post_comments, only: [:create, :destroy]
	end

  resources :post_images, only: [:new, :create, :index, :show, :destroy] do
    resource :favorites,only: [:create, :destroy]
    resource :post_comments, only: [:create, :destroy]
  end

  resources :users, only: [:show, :edit, :edit]

end
