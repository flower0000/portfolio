Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  #homesコントローラー
  root to: 'homes#top'
  get '/about' => 'homes#about', as: 'about'

  #recipeコントローラー(favoritesとreviewsはネストする)
  resources :recipes do
    resource :favorites, only: [:create, :destroy]
  end

  #userコントローラー
  get '/users/mypage' => 'users#show', as: 'mypage'
  get '/users/edit/data' => 'users#edit', as: 'users_edit' #edit_user_registration_pathとURLがかぶるため/customers/edit→/customers/edit/dataに変更
  patch 'users' => 'users#update', as: 'users_update'
  get '/users/check' => 'users#check', as: 'users_check'
  delete '/users/withdrawal' => 'users#withdrawal', as: 'users_withdrawal'


  devise_for :users
end
