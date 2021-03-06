Rails.application.routes.draw do
  post '/exercises/update/name', to: 'exercises#update_name', as: 'update_name'

  # ruta para vista modal para Cambiar nombre
  post '/exercises/edit/name', to: 'exercises#edit_name', as: 'edit_name'

  post '/exercises/edit', to: 'exercises#edit_work_place', as: 'edit_work_place'
  # ruta para ir a editar ejercicio
  get '/exercises/edit/:exercise_id', to: 'exercises#edit', as: 'exercises_edit'
  #Ruta que abre la ventana modal para ingresar el nombre del ejercicio
  get '/exercises/name', to: 'exercises#modal_name', as: 'exercises_modal_name'

  post "/exercise/create_exercise", to: 'exercises#create_exercise', as: 'create_exercise'
  get "/exercise/create_exercise", to: 'exercises#create_exercise', as: 'create_exercise_get'

  post '/exercises/new', to: 'exercises#new', as: 'exercises_new'
  get 'exercises/new', to: 'exercises#new', as: 'exercises'

  #ruta que revisa si un ejercicios esta bien o no
  post '/exercises/:exercise_id/solved' => 'exercises#solved', as: 'solved_exercise'



  #ruta para mostar los ejercicios de un usuario
  get'/exercises/index_user/' => 'exercises#index_user', as: 'exercises_index_user'
  #ruta para mostrar los ejercicios de todos los usuarios (Comunidad)
  get'/exercises/index/' => 'exercises#index', as: 'exercises_index'

  #ruta para ir a resolver un ejercicio
  get '/exercises/:exercise_id', to: 'exercises#show', as: 'show_exercise'
  #ruta para eliminar un ejercicio
  get '/exercises/delete/:exercise_id', to: 'exercises#delete', as: 'exercises_delete'
  #ruta para mostrar los usuarios que han resuelto un ejercicio
  get '/exercises/:exercise_id/users_list', to: 'exercises#users_list', as: 'users_exercise_list'


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
