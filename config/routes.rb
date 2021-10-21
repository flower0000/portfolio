Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  #homesコントローラー
  root to: 'homes#top'
  get '/about' => 'homes#about', as: 'about'

  #recipeコントローラー(favoritesとreviewsはネストする)
  resources :recipe do
    resource :favorites, only: [:create, :destroy]
  end

  #userコントローラー

end
