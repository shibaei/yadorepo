Rails.application.routes.draw do
  devise_for :users
  root to: "posts#index"
  resources :posts
  post "posts/upload_image", to: "posts#upload_image"
end
