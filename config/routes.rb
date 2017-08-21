Rails.application.routes.draw do
<<<<<<< HEAD
  get 'user/show/creacion_de_ejercicios', to: 'users#creacion_de_ejercicios'#, as: user_show_creacion_de_ejercicios
=======
   get 'user/show/creacionejercicios', to: 'users#creacion_de_ejercicios' #, as: creacion_de_ejercicios
>>>>>>> esqueleto

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
