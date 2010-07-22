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
  
#----------------------------------------------------
# muestra la forma de contacto
#----------------------------------------------------
  def contact
    @contact = Contact.new
  end
  
#----------------------------------------------------
# procesa el email
#----------------------------------------------------
  def send_contact_request
    @contact = Contact.new(params['contact'])
    flash[:notice] = ''
    if @contact.save
    begin
        ContactMailer.deliver_contact_message(@contact)
        notify_user
      rescue
        flash[:notice] = 'FLASH/RESCUE: Saved, then problems'
        render :action=>"contact"
    end
    else
      flash[:notice] = 'FLASH: Not saved'
      render :action=>"contact"
    end
  end
  
#----------------------------------------------------
# se muestra cuando un correo es enviado satisfactriamente
#----------------------------------------------------
  def notify_user
    flash[:notice] = 'FLASH: Saved and sent via notify_user'
    render :action=> "sent"
  end

end
