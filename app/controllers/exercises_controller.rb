class ExercisesController < ApplicationController

  def create_exercise
    p "-"* 50
    if params[:authenticity_token]
      #PARAMS: "exercise"=>{"input1"=>"un input"}, "positions"=>{"input1_top"=>"377", "input1_left"=>"18"}
      #Text.new(exercise_id: e.id, x_position: 110, y_position: 397, text: input.last )
      # determinar numero de inputs
      p params[:exercise].count

      inputs = params[:exercise]
      posiciones_keys = params[:positions].keys
      k_index = 0
      p "inputs"
      inputs.each_with_index do |input, index|
        # {"input1_top"=>"377", "input1_left"=>"18"}
          Text.new(text: input.last )
           p posiciones_keys[k_index]
            k_index = k_index + 1
           p posiciones_keys[k_index]
           k_index = k_index + 1
      end
      p "inputs" 


      # for new_input in 1..num_of_inputs do
      #   p "CREATE EXERCISE"
      #   p params[:exercise]#[:input1]
      #
      # end


      # Input.new(x_position: params[:positions][:input1_top], y_position: params[:positions][:input1_top], answer: "20")

    end
    # en la vista posterior a dar click en "terminar ejercicio" se muestran todos lo ejerccios, por ello se crea
    @exercises = Exercise.all
    # mostra vista con todos los ejercicios
    # render "index_user"

    # solo para pruebas, boton_cerrar
    render 'exercises/new'
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
