class ContactMailer < ActionMailer::Base
  
  def contact_message(contact)
    recipients CONTACT_RECIPIENT
    from contact.email_address
    subject "Mensaje de Contacto"
    body['name'] = contact.name
    body['email_address'] = contact.email_address
    body['message'] = contact.message
  end
    
end
