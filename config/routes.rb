Facebook_authentication::Application.routes.draw do
  
  get "home/index"
  root :to => 'home#index'

  match 'auth/:provider/callback', to: 'user#create'
  match 'auth/failure', to: redirect('/')
  match 'signout', to: 'user#destroy', as: 'signout'
  
end
