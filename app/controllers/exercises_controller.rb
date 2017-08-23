class ExercisesController < ApplicationController

  def new
    p "." * 50
    p "new ExercisesController"
    if params[:authenticity_token]
      p params
    end
    p "." * 50
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
    p exercise_id = params[:exercise_id]
    p inputs = Input.where(exercise_id: exercise_id)
    inputs.each do |input|
      if  input.answer == params["#{input.id}"]
        @correct_answers << input.id
      else
        @wrong_answers << input.id
      end
    end
    # borramos: @correct_answers y  @wrong_answers
  end

  def creacion_de_ejercicios
    p "{}"* 50
    p "creacion_de_ejercicios"
    p "{}"* 50
  end

end
