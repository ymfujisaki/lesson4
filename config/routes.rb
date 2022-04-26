Rails.application.routes.draw do

 # get 'favorites/create'
 # get 'favorites/destroy'
  root 'tweets#index'  # 追加
  devise_for :users

# ===========ここはいらないので削除orコメントアウト==========
  #get 'tweets/new'
  #get 'tweets/index'
  #get 'tweets/show'
  #get 'tweets/create'
  #get 'users/index'
  #get 'users/show'
#==================================================

  
  resources :tweets do # 追加
    resource :favorites, only: [:create, :destroy]
  end    
    
  resources :users  do
    resource :relationships, only: [:create, :destroy]
    get :follows, on: :member
    get :followers, on: :member
    
    end
  
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end