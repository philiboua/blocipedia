Rails.application.routes.draw do
  devise_for :users
  get 'welcome/index'
  get 'users/downgrade'


  get 'welcome/about'
  resources :wikis
  resources :charges, only:[:new,:create]

  root to:'welcome#index'
end
