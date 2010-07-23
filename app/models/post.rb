class Post < ActiveRecord::Base
  attr_accessible :name, :topic, :date, :content, :link, :haslink
  attr_reader :created_at
end
