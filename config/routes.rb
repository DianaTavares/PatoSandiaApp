Rails.application.routes.draw do
   get 'user/show/creacionejercicios', to: 'users#creacion_de_ejercicios' #, as: creacion_de_ejercicios

  get 'sessions/new'

  get 'user/new'

  root 'static_pages#home'
  get  '/help',    to: 'static_pages#help'
  get  '/about',   to: 'static_pages#about'
  get  '/contact', to: 'static_pages#contact'
  get  '/signup',  to: 'users#new'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  resources :users
end
