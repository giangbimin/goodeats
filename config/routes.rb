Rails.application.routes.draw do
  get '/menu' => 'menu#index'
  get '/menu/display' => 'menu#display'
  post 'menu/sort'
  get 'pages/index'
  get 'pages/contact'
end
