class PagesController < ApplicationController
  def calendar
    @title = "Calendario de Eventos"
  end

  def gallery
    @title = "Galería de Fotos"
  end

  def about
    @title = "¿Quiénes Somos?"
  end
  
  def kids
    @title = "Kids & Technology"
  end
  
#----------------------------------------------------
# muestra la forma de contacto
#----------------------------------------------------
  def contact
    @title = "Contacto"
    @contact = Contact.new
  end
  
#----------------------------------------------------
# procesa el email
#----------------------------------------------------
  def enviar_mensaje
    @contact = Contact.new(params['contact'])
    if @contact.save
      begin
        ContactMailer::deliver_contact_message(@contact)
        flash[:notice] = 'El mensaje fue enviado satisfactoriamente.'
        redirect_to root_path
      rescue
        @title="Contacto"
        flash[:error] = 'Ocurrió un problema al enviar el mensaje.'
        render :action=>"contact"
      end
    else
      @title="Contacto"
      render :action=>"contact"
    end
  end

end
