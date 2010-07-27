class Job < ActiveRecord::Base
  attr_accessible :created_at, :company, :position, :description, :phone, :email, :fulltime, :internship, :experience, :location, :minpay, :maxpay

validates_presence_of :company, :position, :description, :phone, :email, :experience
validates_format_of :email,
                    :with => %r{\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z}i,
                    :message => "debe de parecer una direccion de email"
  
  YEARS =[
    "menos de 1 año",
    "1 año",
    "2 años",
    "3 años",
    "4 años",
    "5 años",
    "más de 5 años"
  ]
  
  HUMANIZED_COLUMNS = {
	  :company => "Empresa",
	  :position => "Puesto",
	  :descripton => "Descripción",
	  :phone => "Teléfono",
	  :email => "Email",
	  :location => "Ubicación",
	  :experience => "Experiencia",
	  :minpay => "Rango de Sueldo menor",
	  :maxpay => "Rango de Sueldo mayor"
  }

  def self.human_attribute_name(attribute)
	  HUMANIZED_COLUMNS[attribute.to_sym] || super
  end
end
