class UserSessionsController < ApplicationController
  def new
    @user_session = UserSession.new
    @title = "Login"
  end
  
  def create
    @user_session = UserSession.new(params[:user_session])
    if @user_session.save
      flash[:notice] = "Se inicio sesión satisfactoriamente."
      redirect_to root_url
    else
      flash[:error] = "El nombre de usuario y/o contraseña son incorrectos."
      @title = "Login"
      render 'new'
    end
  end
  
  def destroy
    @user_session = UserSession.find
    @user_session.destroy
    flash[:notice] = "Se cerro la sesión satisfactoriamente."
    redirect_to root_url
  end

end
