class ExercisesController < ApplicationController

  def new
    p "." * 50
    p "new ExercisesController"
    if params[:authenticity_token]
      p params
    end
    p "." * 50
  end

  def index
    @user = User.find(params[:user_id])
    @exercises = Exercise.all
  end

  def index_user
    p user_id = params[:user_id]
    p @user = User.find(user_id)
    p @exercises = Exercise.where(user_id: @user.id)
  end

  def show
    p exercise_id = params[:exercise_id]
    p @exercise = Exercise.find(exercise_id)
    p @texts = Text.where(exercise_id: @exercise.id)
    p @inputs = Input.where(exercise_id: @exercise.id)
  end

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

  def creacion_de_ejercicios
    p "{}"* 50
    p "creacion_de_ejercicios"
    p "{}"* 50
  end

end
