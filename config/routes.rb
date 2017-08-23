Rails.application.routes.draw do
  post 'exercises/canva', to: 'exercises#canva'
  #ruta que revisa si un ejercicios esta bien o no
  post '/exercises/:exercise_id/solved' => 'exercises#solved', as: 'solved_exercise'
  
  get 'exercises/canva', to: 'exercises#canva'
  get 'exercises/new_exercises', to: 'exercises#new_exercises' #, as: creacion_de_ejercicios
  #ruta para mostar los ejercicios de un usuario
  get'/exercises/index_user/:user_id/' => 'exercises#index_user', as: 'index_user_exercises'
  #ruta para ir a resolver un ejercicio
  get '/exercises/:exercise_id' => 'exercises#show', as: 'show_exercise'
  get 'exercises/new'

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
