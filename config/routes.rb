Rails.application.routes.draw do
  devise_for :users, controllers:{
    registrations: 'users/registrations',
  }
  devise_scope :user do
    get 'addresses', to: 'users/registrations#new_address'
    post 'addresses', to: 'users/registrations#create_address'
  end
  root to: 'items#index'
  get 'items/purchase', to: 'items#purchase'
  resources :items
  resources :users
  # あとで確認
  # memberにする
  resources :cards, only: [:new, :create] do
    # post 'pay', on: :collection
  end
end
