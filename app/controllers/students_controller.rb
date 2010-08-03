class StudentsController < ApplicationController
  # GET /students
  # GET /students.xml
  def index
    @students = Student.all
  end

  # GET /students/1
  # GET /students/1.xml
  def show
    @student = Student.find(params[:id])
  end

  # GET /students/new
  # GET /students/new.xml
  def new
    @student = Student.new
    @title = "Registrar Alumno"
  end

  # GET /students/1/edit
  def edit
    @student = Student.find(params[:id])
  end

  # POST /students
  # POST /students.xml
  def create
    @student = Student.new(params[:student])

    if @student.save
      flash[:notice] = 'Se registro satisfactoriamente.'
      redirect_to registro_path
    else
      @title = "Registrar Alumno"
      flash[:error] = 'Hubo problemas al registrarse.'
      render :action => "new"
    end
  end

  # PUT /students/1
  # PUT /students/1.xml
  def update
    @student = Student.find(params[:id])

    respond_to do |format|
      if @student.update_attributes(params[:student])
        format.html { redirect_to(@student, :notice => 'Student was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @student.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /students/1
  # DELETE /students/1.xml
  def destroy
    @student = Student.find(params[:id])
    @student.destroy

    respond_to do |format|
      format.html { redirect_to(students_url) }
      format.xml  { head :ok }
    end
  end
end
