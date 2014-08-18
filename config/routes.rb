Rails.application.routes.draw do
  root 'maps#index'
  post '/' => 'maps#search'
end
