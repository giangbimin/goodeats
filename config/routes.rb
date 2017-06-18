Rails.application.routes.draw do
  get 'done_order/show'

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
  get 'orders/index'
  post 'orders/add'
  post 'orders/coupon'
  post 'orders/remove'
  post 'orders/create'
  get 'orders/success'
  get 'done_order/show'
end
