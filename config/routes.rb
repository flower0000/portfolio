Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  #homesコントローラー
  root to: 'homes#top'
  get '/about' => 'homes#about', as: 'about'

  #recipeコントローラー(favoritesとreviewsはネストする)
  resources :recipes do
    resource :favorites, only: [:create, :destroy]
    resources :reviews
  end

  #userコントローラー
  get '/users/mypage' => 'users#show', as: 'mypage'
  get '/users/index/:id' => 'users#other_user', as: 'other_user'#deviseのルーティングと被るためindexの文字をかませた
  get '/users' => 'users#index', as: 'users_index'
  get '/users/edit/data' => 'users#edit', as: 'users_edit' #edit_user_registration_pathとURLがかぶるため/customers/edit→/customers/edit/dataに変更
  #patch 'users' => 'users#update', as: 'users_update' usersにネストしたいルーティングあるので
  get '/users/check' => 'users#check', as: 'users_check'
  delete '/users/withdrawal' => 'users#withdrawal', as: 'users_withdrawal'
  get '/users/search/' => 'users#search', as: 'search'#検索用

  resources :users, only: [:update] do
    resource :relationships, only: [:create, :destroy]
    get :follows, on: :member # 追加
    get :followers, on: :member # 追加
  end


  devise_for :users
end
