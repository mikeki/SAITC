class UsersController < ApplicationController
  before_filter :require_user
  
  def index
    @title = "Listado de Usuarios"
    @users=User.all
  end
  
  def new
    @user = User.new
    @title = "Registrando a un Nuevo Usuario"
  end
  
  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:notice] = "Se creo un nuevo usuario satisfactoriamente."
      redirect_to root_url
    else
      @title = "Registrando a un Nuevo Usuario"
      render :action => 'new'
    end
  end
  
  def edit
    @user = current_user
    @title = "Editando al Usuario #{@user.username}"
  end
  
  def update
    @user = current_user
    if @user.update_attributes(params[:user])
      flash[:notice] = "Se actualizo un usuario satisfactoriamente."
      redirect_to root_url
    else
      @title = "Editando al Usuario #{@user.username}"
      render :action => 'edit'
    end
  end
end
