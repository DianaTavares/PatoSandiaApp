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

  def new
    p "." * 50
    p "new ExercisesController"
    if params[:authenticity_token]
      p params
    end
    p "." * 50
  end

  # def creacion_de_ejercicios
  #
  # end
end