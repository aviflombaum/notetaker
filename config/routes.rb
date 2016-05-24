Rails.application.routes.draw do

  resources :tags
  resources :notebooks do
    resources :notes, only: [:show, :new, :edit]
  end
  resources :notes
  get 'notes/:id/content', to: 'notes#content'
  resources :references
  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks" }
  root 'notebooks#index'
  get 'top_notes', to: 'notebooks#top_notes'


end
