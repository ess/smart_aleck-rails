Rails.application.routes.draw do
  devise_for :users

  resources :categories
  resources :entries

  get '/tags/*tags' => 'entries#index', as: :entries_tagged

  root to: 'entries#index'
end
