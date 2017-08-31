class ExercisesController < ApplicationController

  def update_name
    p "-" * 50
    p "update_name"
    p @new_name = params[:name][:new_name_exercise]
    # p @name_exercise_id = params[:format]
    # redirect_to edit_work_place_path(@name_exercise_id)
  end


  def edit_name
    p "-"* 50
    p "edit name"
    # @name_exercise_id = params[:format]
  end

  def edit_work_place
    #  p "+" * 50
    #  p "edit_work_place"
     #para guardar los id de los elementos editados
     res_id = []
     pre_id = []
    #  p "EDIT"
    #  para los nuevos inputs
      if params[:authenticity_token]
        # para los inputs ya existentes
        # si hay preguntas a editar
        if params[:PREG_ID_ed]
          # iterar el los id, cada preg es preg1, preg2, etc, en
            params[:PREG_ID_ed].each do |preg|
              # objtener id, content, X y Y,
              id = params[:PREG_ID_ed][preg]
              #guardamos los id pra revisar los elementos eliminados
              pre_id << id.to_i
              content = params[:PREG_CONT_ed][preg]
              # top = Y
              p top = params[:PREG_Top_ed][preg]
              # left = X
              p left = params[:PREG_Left_ed][preg]
              # encontrar pregunta, cada preunta es un obj Text
              pregunta = Text.find(id)
              # actualizar
              pregunta.update(x_position: left, y_position: top, text: content)
              # salvar
              pregunta.save
              # p "-" * 50
            end
        end
        # si hay respuestas
        if params[:RESP_ID_ed]
          # iterar en los idś respuestas
            params[:RESP_ID_ed].each do |resp|
              # cada resp es resp1, resp2, etc
             # obtener ID, content, Y y Y
              id = params[:RESP_ID_ed][resp]
              res_id << id.to_i
              content = params[:RESP_CONT_ed][resp]
              top = params[:RESP_Top_ed][resp]
              left = params[:RESP_Left_ed][resp]
              # encontrar resp
              respuesta = Input.find(id)
              # actualizar
              respuesta.update(x_position: left, y_position: top, answer: content)
              # salvar
              respuesta.save
              # p "-" * 50
            end
        end
      end
      #metodo para elimiar de la base de datos los elementos que se borraron
      inputs = Input.where(exercise_id: $exercise_id_edit)
      texts = Text.where(exercise_id: $exercise_id_edit)
      #comparamos los id de los elementos que tenia el ejercicios y los comparamos con los que quedarn en el area de trabajo, los que no esten se eliminan
      inputs.each do |input|
        unless res_id.include?(input.id)
          input.destroy
        end
      end
      texts.each do |text|
        unless pre_id.include?(text.id)
          text.destroy
        end
      end
      if params[:exercise] != nil
        inputs = params[:exercise]
        # obtener las claves del hash positions=> "positions"=>{"input1_top"=>"377", "input1_left"=>"18"}
        posiciones_keys = params[:positions].keys
        k_index = 0
        inputs.each_with_index do |input, index|
          #  p "-" * 50
          # cada input es un Ary["si es Text o input", "el valor del mismo"]
          # objener el value de cada posicion, a través del Arry posiciones_keys, el cual es convertido en simbolo, ya que es un string en el Array
          #  y asignar top
          top =   params[:positions][posiciones_keys[k_index].to_sym]
          # sumar uno a la llave del index para buscar el siguiente param
          k_index = k_index + 1
          # extraer valores del left del pararam positions
          left =  params[:positions][posiciones_keys[k_index].to_sym]
          k_index = k_index + 1

          # determinar si se trata de un un input o un text, cada ary contiene d elementos, el primer es que dice Text o input
          # si inicia con i es input
          if input[0].chr == "i"
            # crear elobjeto y agregar atributos
            input_ob = Input.new(answer: input.last, x_position: left.to_i, y_position: top.to_i)
            # si inicia con t es texto
          elsif input[0].chr ==  "t"
            input_ob = Text.new(text: input.last, x_position: left.to_i, y_position: top.to_i)
          end
          input_ob.update(exercise_id: $exercise_id_edit)
          input_ob.save
        end
      end
     # en la vista posterior a dar click en "terminar ejercicio" se muestran todos lo ejerccios, por ello se crea
     # mostra vista con todos los ejercicios
     @exercises = Exercise.where(user_id: current_user.id)
     render "index_user"
    #  p "+" * 50
  end

  def edit
    #  p "." * 50
    #  p "EDIT"
      exercise_id = params[:exercise_id]
      @exercise = Exercise.find(exercise_id)
      @texts = Text.where(exercise_id: @exercise.id)
      @inputs = Input.where(exercise_id: @exercise.id)
      $exercise_id_edit = exercise_id
    #  p "." * 50
  end

  def new
    p "." * 50
    p "new ExercisesController"
    # el authenticity_token existe solo se viene de un formulario
    if params[:authenticity_token]
      # si el nombre del ejercio estáen blanco se pide que se ingrese uno y se redirije al perfil
      if  params[:exercises][:name_exercise] == ""
        flash[:danger] = "Tu nuevo ejercicio debe tener un nombre"
        redirect_to :back
      else
        $name_exercise = params[:exercises][:name_exercise]
      end
      # si el nombre no esta vacio se agrega a variable global, que es posteriormente usada en el boton terminar ejercicio

    end
    # p "." * 50
    p $name_exercise
  end

  def create_exercise
    p "-"* 50
    p "CREATE  EXERCISE"
    # p $name_exercise
    if params[:authenticity_token]
      # crear ibjeto para asigar el enercios CAMBIAR
      p $name_exercise
      p e = Exercise.create(user_id: current_user.id, name: $name_exercise)

      #PARAMS: "exercise"=>{"input1"=>"un input"}, "positions"=>{"input1_top"=>"377", "input1_left"=>"18"}
      # {"input1_top"=>"377", "input1_left"=>"18"}
      # determinar numero de inputs
      #  obtener los inputs_text => {"input1"=>"un input"}, "positions"=>{"input1_top"=>"377", "input1_left"=>"18"}
      inputs = params[:exercise]
      # obtener las claves del hash positions=> "positions"=>{"input1_top"=>"377", "input1_left"=>"18"}
      posiciones_keys = params[:positions].keys
      k_index = 0
      inputs.each_with_index do |input, index|
        p "-" * 50
        # cada input es un Ary["si es Text o input", "el valor del mismo"]
        # objener el value de cada posicion, a través del Arry posiciones_keys, el cual es convertido en simbolo, ya que es un string en el Array
          #  y asignar top
          top =   params[:positions][posiciones_keys[k_index].to_sym]
          # sumar uno a la llave del index para buscar el siguiente param
          k_index = k_index + 1
          # extraer valores del left del pararam positions
          left =  params[:positions][posiciones_keys[k_index].to_sym]
          k_index = k_index + 1

          # determinar si se trata de un un input o un text, cada ary contiene d elementos, el primer es que dice Text o input
          # si inicia con i es input
          # p input[0]
          if input[0].chr == "i"
            # crear elobjeto y agregar atributos
            input_ob = Input.new(answer: input.last, x_position: left.to_i, y_position: top.to_i)
          # si inicia con t es texto
          elsif input[0].chr ==  "t"
            input_ob = Text.new(text: input.last, x_position: left.to_i, y_position: top.to_i)
          end

          input_ob.update(exercise_id: e.id)
           input_ob.save
          # p "*" * 50
      end
    end
    # en la vista posterior a dar click en "terminar ejercicio" se muestran todos lo ejerccios, por ello se crea
    @exercises = Exercise.where(user_id: current_user.id)
    # mostra vista con todos los ejercicios
    render "index_user"
    # limpiar variable glob
    p $name_exercise = nil if e.name == Exercise.last.name
  end


  #Muestra la lista de otos los ejercicios creados
  def index
    @user = User.find(current_user.id)
    @exercises = Exercise.all
  end

  #Muestra los ejercicios creados por un solo usuario
  def index_user
    p "*" * 50
    p "index_user"
    if current_user.status == "teacher" || current_user.admin?# && !current_user?(user)
      user_id = current_user.id
      @user = User.find(user_id)
      @exercises = Exercise.where(user_id: @user.id)
    elsif current_user.status == "student"
      redirect_to(current_user)
    end
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


  #Acción para mostrar una lista con los usuariosque han resuleto un ejercicio, hace llamada a js
  def users_list
    @exercise = Exercise.find(params[:exercise_id])
    @name_score = []
    @users_exercise = UserExercise.where(exercise_id: @exercise.id)
    @users_exercise.each do |round|
      @name_score << [round.user.name, round.score]
    end
    @name_score.sort_by! do |item|
      item[0]
    end
    p @name_score
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
