class CreateJobs < ActiveRecord::Migration
  def self.up
    create_table :jobs do |t|
      t.string :company
      t.string :position
      t.text :description
      t.string :phone
      t.string :email
      t.boolean :fulltime
      t.boolean :internship
      t.date :duedate
      t.timestamps
    end
  end
  
  def self.down
    drop_table :jobs
  end
end
