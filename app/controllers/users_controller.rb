class UsersController < ApplicationController
  before_filter :require_user
  
  def new
    @user = User.new
    @title = "Registrando a un Nuevo Usuario"
  end
  
  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:notice] = "Registration successful."
      redirect_to root_url
    else
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
      flash[:notice] = "Successfully updated profile."
      redirect_to root_url
    else
      render :action => 'edit'
    end
  end
end
