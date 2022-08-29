Rails.application.routes.draw do

   namespace :admin do
    resources :users, only:[:index, :show, :edit, :update]
    resources :post_images, only:[:index, :show, :edit, :update, :destroy]
    resources :post_comments, only: [:destroy]
  end

  namespace :public do
    get 'relationships/followings'
    get 'relationships/followers'
  end
  root to:'public/homes#top'

  namespace :public do
    get 'about'=> 'homes#about',as: 'about'

    resources :users, only: [:index, :show, :edit, :update, :destroy]
    get 'unsubscribe' => 'users#unsubscribe'
    patch 'withdraw' => 'users#withdraw'

    resources :post_images

    get 'search' => 'post_images#search'

    resources :post_comments, only: [:create, :destroy]

    resource :favorites, only:[:create, :destroy]

    resources :relationships, only: [:create, :destroy]

   get 'followings' => 'relationships#followings', as: 'followings'
   get 'followers'  => 'relationships#followers', as: 'followers'
  end

  devise_for :users,controllers:{
    registrations:"public/registrations",
    sessions:'public/sessions'
  }

  devise_for :admins,controllers:{
    sessions:"admin/sessions"
  }

  post '/public/homes/guest_sign_in', to: 'public/homes#guest_sign_in'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
