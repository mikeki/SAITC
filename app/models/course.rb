class Course < ActiveRecord::Base
  has_many :assistants
  
  attr_accessible :name, :description, :courseDate, :place, :maximumAssistants, :assistantsNumber, :price
  
  HUMANIZED_COLUMNS = {
	  :name => "Nombre del Curso",
	  :description => "Descripción",
	  :courseDate => "Fecha",
	  :place => "Lugar",
	  :maximumAssistants => "Cupo",
	  :assistantsNumber => "Asistentes Inscritos",
	  :price => "Precio"
  }

  def self.human_attribute_name(attribute)
	  HUMANIZED_COLUMNS[attribute.to_sym] || super
  end
  
end
