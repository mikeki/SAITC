class AssistantsController < ApplicationController
  before_filter :require_user, :only=>[:index, :edit, :destroy]
  
  # GET /assistants
  # GET /assistants.xml
  def index
    @assistants = Assistant.all
    @title = "Listado de Asistentes"

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @assistants }
    end
  end

  # GET /assistants/1
  # GET /assistants/1.xml
  def show
    @title = "Información de Asistente"
    @assistant = Assistant.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @assistant }
    end
  end

  # GET /assistants/new
  # GET /assistants/new.xml
  def new
    @title = "Registro de Asistente"
    @assistant = Assistant.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @assistant }
    end
  end

  # GET /assistants/1/edit
  def edit
    @title = "editando asistente"
    @assistant = Assistant.find(params[:id])
  end

  # POST /assistants
  # POST /assistants.xml
  def create
    @assistant = Assistant.new(params[:assistant])

    if @assistant.save
      flash[:notice] = 'Asistentes registrado satisfactoriamente.'
      @assistant.course.update_attribute(:assistantsNumber, @assistant.course.assistantsNumber + 1)
      redirect_to @assistant
    else
      @title = "Registro de Asistente"
      flash[:error]="Ocurrio un error al registrar el asistente."
      render :action => 'new'
    end
  end

  # PUT /assistants/1
  # PUT /assistants/1.xml
  def update
    @assistant = Assistant.find(params[:id])

    respond_to do |format|
      if @assistant.update_attributes(params[:assistant])
        format.html { redirect_to(@assistant, :notice => 'Assistant was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @assistant.errors, :status => :unprocessable_entity }
      end
    end
  end

  def pay
    @assistant = Assistant.find(params[:id])
    if @assistant.update_attribute(:payed, true)
      flash[:notice] = 'Se cobro satisfactoriamente.'
    else
      flash[:error] = 'No se pudo guardar el cobro'
    end
    redirect_to assistants_path
  end  
  
  # DELETE /assistants/1
  # DELETE /assistants/1.xml
  def destroy
    @assistant = Assistant.find(params[:id])
    @assistant.destroy

    respond_to do |format|
      format.html { redirect_to(assistants_url) }
      format.xml  { head :ok }
    end
  end
end
