class CreateJobs < ActiveRecord::Migration
  def self.up
    create_table :jobs do |t|
      t.string :company
      t.string :position
      t.string :description
      t.string :phone
      t.string :email
      t.boolean :fulltime, :default=>"0"
      t.date :duedate
      t.timestamps
    end
  end
  
  def self.down
    drop_table :jobs
  end
end
