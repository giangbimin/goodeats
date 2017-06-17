Rails.application.routes.draw do
  get '/menu' => 'menu#index'
  get '/menu/display' => 'menu#display'
  post 'menu/sort'
  get 'pages/index'
  get '/contact-us' => 'pages#contact'
  root to: 'pages#index'
  resources :food do
    resources :ratings, only: [:create]
  end
end
