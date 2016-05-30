Rails.application.routes.draw do

  resources :tags
  resources :notebooks do
    resources :notes
  end
  resources :notes
  get 'notes/:id/content', to: 'notes#content'
  resources :references
  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks" }
  root 'notebooks#index'

end
