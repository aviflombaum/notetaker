Rails.application.routes.draw do

  resources :tags
  resources :notebooks do
    resources :notes, only: [:show, :new, :edit]
  end
  resources :notes
  get 'notes/:id/content', to: 'notes#content'
  resources :references
  get 'references/:id/reference_data', to: 'references#reference_data'
  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks" }
  root 'notebooks#index'

end
