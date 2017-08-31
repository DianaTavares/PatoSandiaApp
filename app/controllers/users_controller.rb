class UsersController < ApplicationController
  before_action :logged_in_user, only: [:index, :edit, :update, :destroy]
  before_action :correct_user,   only: [:edit, :update]
  before_action :admin_user,     only: :destroy

  def creacion_de_ejercicios

  end

  def index
    @users = User.paginate(page: params[:page])
  end

  def show
    #Camiamos el uso de params[:id], por el de current user para que no pudiara un usuario acceder a un perfil que no es el suyo
    @user = User.find(current_user.id)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    p "+" * 50
    p user_params
    if @user.save
      log_in @user
      flash[:success] = "Bienvenido a SiTREC de PatoSandia!"
      redirect_to @user
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "cambios en el Perfil guardados"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    user = User.find(params[:id])
    #con la dependencia de la eliminacion del os hijos, eliminado el ejercicio, se eliminan textos e inputs
    exercises = Exercise.where(user_id: user.id)
    exercises.each do |exercise|
      exercise.destroy
    end
    #elimina ejercicios y user_exercises
    user.destroy
    flash[:success] = "Usuario y todas sus dependencias se han eliminado"
    redirect_to users_url
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation,:status)
    end

    # Before filters

    # Confirms a logged-in user.
    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "Primero has Log In"
        redirect_to login_url
      end
    end

    # Confirms the correct user.
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end

    # Confirms an admin user.
    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end

end
