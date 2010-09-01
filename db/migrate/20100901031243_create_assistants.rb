class CreateAssistants < ActiveRecord::Migration
  def self.up
    create_table :assistants do |t|
      t.string :fname
      t.string :lname
      t.string :email
      t.string :studentid
      t.integer :course_id
      t.string :career
      t.boolean :payed, :default=>"0"

      t.timestamps
    end
  end

  def self.down
    drop_table :assistants
  end
end
