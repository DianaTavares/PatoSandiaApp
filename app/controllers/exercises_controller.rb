class ExercisesController < ApplicationController

  def new
    p "." * 50
    p "new ExercisesController"
    if params[:authenticity_token]
      p params
    end
    p "." * 50
  end

  #Muestra la lista de otos los ejercicios creados
  def index
    @user = User.find(current_user.id)
    @exercises = Exercise.all
  end

  #Muestra los ejercicios creados por un solo usuario
  def index_user
    p user_id = current_user.id
    p @user = User.find(user_id)
    p @exercises = Exercise.where(user_id: @user.id)
  end

  #Muestra un ejercicios para poder sr resuelto
  def show
    p exercise_id = params[:exercise_id]
    p @exercise = Exercise.find(exercise_id)
    p @texts = Text.where(exercise_id: @exercise.id)
    p @inputs = Input.where(exercise_id: @exercise.id)
  end

  #Acción que revisa si el ejericico se resolvio correctamente
  def solved
    @correct_answers = []
    @wrong_answers = []
    exercise_id = params[:exercise_id]
    @exercise = Exercise.find(exercise_id)
    inputs = Input.where(exercise_id: exercise_id)
    inputs.each do |input|
      if  input.answer == params["#{input.id}"]
        @correct_answers << input.id
      else
        @wrong_answers << input.id
      end
    end
    #Solo se guardará el ejercicio en la base de datos si el usuaio no es el que creo el ejercicio
    if current_user.id != @exercise.user_id
      p UserExercise.create(user_id: current_user.id, exercise_id: @exercise.id, score: @correct_answers.length)
    end
  end

  #abrir la ventana modal para ponerle nombre al ejercicio
  def modal_name
  end

  def creacion_de_ejercicios
    p "{}"* 50
    p "creacion_de_ejercicios"
    p "{}"* 50
  end

  #Acción para mostrar una lista con los usuariosque han resuleto un ejercicio, hace llamada a js
  def users_list
    @exercise = Exercise.find(params[:exercise_id])
    @users_exercise = UserExercise.where(exercise_id: @exercise.id)
  end

  #Acción para elimiar ejericios (llamada en la página de mis ejercicios)
  def delete
    Exercise.find(params[:exercise_id]).destroy
    # Eliminamos todo lo relacionado a ese ejericio
    texts = Text.where(exercise_id: params[:exercise_id])
    inputs = Input.where(exercise_id: params[:exercise_id])
    texts.each do |text|
      text.destroy
    end
    inputs.each do |input|
      input.destroy
    end
    flash[:success] = "Ejercicio Eliminado"
    redirect_to exercises_index_user_path
  end

end
