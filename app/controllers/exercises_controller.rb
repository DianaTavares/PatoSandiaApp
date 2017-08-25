class ExercisesController < ApplicationController

  def create_exercise
    p "-"* 50
    if params[:authenticity_token]
      #PARAMS: "exercise"=>{"input1"=>"un input"}, "positions"=>{"input1_top"=>"377", "input1_left"=>"18"}
      # {"input1_top"=>"377", "input1_left"=>"18"}              
      # determinar numero de inputs
      p params[:exercise].count
      #  obtener los inputs_text => {"input1"=>"un input"}, "positions"=>{"input1_top"=>"377", "input1_left"=>"18"}
      inputs = params[:exercise]
      # obtener las claves del hash positions=> "positions"=>{"input1_top"=>"377", "input1_left"=>"18"}
      posiciones_keys = params[:positions].keys
      k_index = 0
      inputs.each_with_index do |input, index|
          # objener el value de cada posicion, a través del Arry posiciones_keys, el cual es convertido en simbolo, ya que es un string en el Array
          top =   params[:positions][posiciones_keys[k_index].to_sym]
          k_index = k_index + 1
          left =  params[:positions][posiciones_keys[k_index].to_sym]
          k_index = k_index + 1
          p input = Input.new(answer: input.last, x_position: left.to_i, y_position: top.to_i, exercise_id: 1)
          p input.save
          p input
      end



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
