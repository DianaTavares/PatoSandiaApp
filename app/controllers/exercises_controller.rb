class ExercisesController < ApplicationController

  # def new_exercises
  #   p "-" * 50
  #   p "metodo new_exercises"
  #   @exercise = Exercise.new
  #   # render 'exercises/new_exercises'
  #   #  p respond_to :html, :js
  #   p "." * 50
  # end
  #
  # def new_canva
  #   p "!" * 50
  #   p "metodo new_canva"
  #   @exercise = Exercise.new
  #   p "!" * 50
  # end

# # <<<<<<< HEAD
  # def new_canva
  #   p "!" * 50
  #   p "metodo new_canva"
  #   @exercise = Exercise.new
  #   p "!" * 50
  # end
#
# =======
# >>>>>>> creacion_ejercicios

  def new
    p "." * 50
    p "new ExercisesController"
    if params[:authenticity_token]
      p params
    end
    p "." * 50
  end

# <<<<<<< HEAD
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
    p @correct_answers
    p @wrong_answers
  end

# =======
  # def creacion_de_ejercicios
  #
  # end
# >>>>>>> creacion_ejercicios
end
