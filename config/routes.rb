Rails.application.routes.draw do
  resources :notes
  resources :notebooks
  devise_for :users
  root 'site#index'


end
