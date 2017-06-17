Rails.application.routes.draw do
  get '/menu' => 'menu#index'
  get '/menu/display' => 'menu#display'
  post 'menu/sort'
  get 'pages/index'
  get '/contact-us' => 'pages#contact'
  root to: 'pages#index'
  resources :foods, only: [:show]
  resources :food do
    resources :ratings, only: [:create]
  end
  post 'orders/add'
  get 'orders/index'
  post 'orders/create'
  post 'orders/coupon'
  post 'orders/remove'
end
