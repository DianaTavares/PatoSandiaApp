Rails.application.routes.draw do
  # post 'exercises/canva', to: 'exercises#canva'
  # get 'exercises/canva', to: 'exercises#canva'
  # get 'exercises/new_exercises', to: 'exercises#new_exercises' #, as: creacion_de_ejercicios

  # get 'exercises/new', to: 'users#creacion_de_ejercicios' #, as: user_show_creacion_de_ejercicios
  # ruta para enviar los inputs creados del ejercio
  post '/exercises/new'
  # ruta para nuevo ejercicio
  get 'exercises/new'

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
