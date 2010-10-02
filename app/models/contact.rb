# ...\models\contact.rb
class Contact < Tableless
  column :name,          :string
  column :email_address, :string
  column :subject,       :string
  column :message,       :text
  column :captcha,       :string
  validates_presence_of  :name, :email_address, :subject, :message, :captcha
  validates_format_of    :email_address,
                         :with => %r{\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z}i,
                         :message => "debe de parecer una direccion de email"
  validates_format_of    :captcha,
                         :with => %r{diez},
                         :message => "! Introduce la palabra de verificación correctamente."
                         
  HUMANIZED_COLUMNS = {
	  :name => "Nombre",
	  :email_address => "Email",
	  :message => "Mensaje",
	  :subject => "Asunto"
  }

  def self.human_attribute_name(attribute)
	  HUMANIZED_COLUMNS[attribute.to_sym] || super
  end
end #class
