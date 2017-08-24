class ExercisesController < ApplicationController

  def create_exercise
    p "-"* 50
    p "CREATE EXERCISE"
    if params[:authenticity_token]
      #  "positions"=>{"input1-top"=>"377", "input1-left"=>"18", "input2-top"=>"477", "input2-left"=>"18"}
      #  Input.new(x_position: 160, y_position: 397, answer: "20")
      # Text.create(exercise_id: e.id, x_position: 110, y_position: 397, text: "5 x 4 =")
      p params
    end
    # en la vista posterior a dar click en "terminar ejercicio" se muestran todos lo ejerccios, por ello se crea
    @exercises = Exercise.all
    # mostra vista con todos los ejercicios
    render "index_user"
    p "-"* 50
  end

  def new
    # p "." * 50
    # p "new ExercisesController"
    # p "." * 50
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


end
