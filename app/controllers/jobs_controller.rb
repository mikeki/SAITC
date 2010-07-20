class JobsController < ApplicationController
  before_filter :requir_user, :except=>[:index, :show]
  def index
    @jobs = Job.all
  end
  
  def show
    @job = Job.find(params[:id])
  end
  
  def new
    @job = Job.new
  end
  
  def create
    @job = Job.new(params[:job])
    if @job.save
      flash[:notice] = "Se publico la oferta de trabajo satisfactoriamente."
      redirect_to @job
    else
      flash[:error]="Ocurrio un error al publicar la oferta de trabajo."
      render :action => 'new'
    end
  end
  
  def edit
    @job = Job.find(params[:id])
  end
  
  def update
    @job = Job.find(params[:id])
    if @job.update_attributes(params[:job])
      flash[:notice] = "Se actualizo la oferta de trabajo satisfactoriamente."
      redirect_to @job
    else
      flash[:error]="Ocurrio un error al actualizar la oferta de trabajo."
      render :action => 'edit'
    end
  end
  
  def destroy
    @job = Job.find(params[:id])
    @job.destroy
    flash[:notice] = "Se elimino satisfactoriamente la oferta de trabajo."
    redirect_to jobs_url
  end
end
