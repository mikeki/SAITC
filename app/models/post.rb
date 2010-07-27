class Post < ActiveRecord::Base
  attr_accessible :name, :topic, :content, :link, :haslink, :created_at
  validates_presence_of :name, :topic, :content
  
  TOPIC = [
  ["General - SAITC", "saitc"],
  ["Evento", "event"],
  ["Format Fest", "format"],
  ["Socialware", "sw"]
  ]

  HUMANIZED_COLUMNS = {
	  :name => "Título",
	  :topic => "Tema",
	  :content => "Contenido",
	  :link => "Link"
  }

  def self.human_attribute_name(attribute)
	  HUMANIZED_COLUMNS[attribute.to_sym] || super
  end
end
