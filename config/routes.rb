Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'shizens/:shizen_id/likes' => 'likes#create'
  get 'shizens/:shizen_id/likes/:id' => 'likes#destroy'
  resources :shizens

  resources :shizens do
    resources :likes, only: [:create, :destroy]
    resources :comments, only: [:create]
  end
  
  resources :users, only: [:index, :show, :edit, :update] do
    resource :relationships, only: [:create, :destroy]
      get "followings" => "relationships#followings", as: "followings"
      get "followers" => "relationships#followers", as: "followers"
  end

  root 'shizens#index'
  delete 'shizens/:id' => 'shizens#destroy'

end











