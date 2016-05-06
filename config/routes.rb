Rails.application.routes.draw do

  resources :notebooks do
    resources :notes, only: [:show, :new, :edit]
  end
  resources :notes
  resources :references
  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks" }
  root 'notebooks#index'


end
