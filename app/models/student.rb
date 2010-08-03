class Student < ActiveRecord::Base
  validates_presence_of :email, :fname, :lname
  validates_format_of    :email,
                         :with => %r{\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z}i,
                         :message => "debe de parecer una direccion de email"
                         
  HUMANIZED_COLUMNS = {
	  :fname => "Nombre",
	  :lname => "Apellido",
	  :email => "Email"
  }

  def self.human_attribute_name(attribute)
	  HUMANIZED_COLUMNS[attribute.to_sym] || super
  end
  
end
