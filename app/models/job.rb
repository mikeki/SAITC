class Job < ActiveRecord::Base
  attr_accessible :created_at, :company, :position, :description, :phone, :email, :fulltime, :internship, :duedate, :experience, :location, :minpay, :maxpay
  
  YEARS =[
    "menos de 1 año",
    "1 año",
    "2 años",
    "3 años",
    "4 años",
    "5 años",
    "más de 5 años"
  ]
end
