Rails.application.routes.draw do
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  devise_for :users
  root to: 'books#index'
  resources :books
  resources :users, only: %i(index show) do
    resource :followings, only: [:create, :destroy]
    get 'followed_users' => 'followings#followed_users', as: 'followed_users'
    get 'follower_users' => 'followings#follower_users', as: 'follower_users'
  end
end
