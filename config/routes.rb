Rails.application.routes.draw do


  root to:'public/homes#top'

  namespace :public do
    get 'about'=> 'homes#about',as: 'about'
  end

  namespace :public do
    resources:users,only:[:index,:show,:edit,:update,:destroy]
    get 'unsubscribe' => 'users#unsubscribe'
    patch 'withdraw' => 'users#withdraw'
  end

  namespace :public do
    resources:post_images
    get 'search' => 'post_images#search'
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
