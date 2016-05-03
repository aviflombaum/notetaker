Rails.application.routes.draw do
  resources :references
  resources :notes
  resources :notebooks do
    resources :notes, only: [:new, :show]
  end
  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks" }
  root 'site#index'


end
