class Post < ActiveRecord::Base
  attr_accessible :name, :topic, :date, :content, :link
end
