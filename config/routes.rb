Rails.application.routes.draw do
  root 'maps#index'
  post '/' => 'maps#locations'
end
