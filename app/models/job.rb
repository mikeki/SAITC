class Job < ActiveRecord::Base
  attr_accessible :company, :position, :description, :phone, :email, :fulltime, :duedate
end
