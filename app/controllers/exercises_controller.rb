class ExercisesController < ApplicationController

  def new_exercises
    p "-" * 50
    p "metodo new_exercises"
    @exercise = Exercise.new
    # render 'exercises/new_exercises'
    #  p respond_to :html, :js
    p "." * 50
  end

  def new_canva
    p "!" * 50
    p "metodo new_canva"
    @exercise = Exercise.new
    p "!" * 50
  end

  def new

  end

  def index_user
    p user_id = params[:user_id]
    p @user = User.find(user_id)
    p @exercises = Exercise.where(user_id: @user.id)
  end

  def show
    p exercise_id = params[:exercise_id]
    p @exercise = Exercise.find(exercise_id)
  end
end
