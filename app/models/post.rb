class Post < ActiveRecord::Base
  attr_accessible :name, :topic, :date, :content, :link, :haslink, :created_at
  
  TOPIC = [
  ["General - SAITC", "saitc"],
  ["Evento", "event"],
  ["Format Fest", "format"],
  ["Socialware", "sw"]
  ]

end
