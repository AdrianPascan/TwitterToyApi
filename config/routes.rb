Rails.application.routes.draw do
  resources :subscriptions
  resources :comments
  resources :reactions
  resources :posts
  resources :users

  post "users" => "users#create"
  put "users/:id" => "users#update"
  patch "users/:id" => "users#update"
  delete "users/:id" => "users#destroy"
  get "users/feed/:id" => "users#feed"
  get "users/feed/subscriptions/:id" => "users#subscriptions_feed"
  post "posts" => "posts#create"
  put "posts/:id" => "posts#update"
  patch "posts/:id" => "posts#update"
  delete "posts/:id" => "posts#destroy"
  get "posts/comments/:id" => "posts#comments"
  post "comments" => "comments#create"
  put "comments/:id" => "comments#update"
  patch "comments/:id" => "comments#update"
  delete "comments/:id" => "comments#destroy"
  post "reactions" => "reactions#create"
  delete "reactions/:id" => "reactions#destroy"
  post "subscriptions" => "subscriptions#create"
  delete "subscriptions/:id" => "subscriptions#destroy"
end
