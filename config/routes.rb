Rails.application.routes.draw do
  root 'maps#index'
  post '/' => 'maps#locations'
  post '/address' => 'maps#address'
end
