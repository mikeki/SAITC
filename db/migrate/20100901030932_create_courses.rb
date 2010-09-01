class CreateCourses < ActiveRecord::Migration
  def self.up
    create_table :courses do |t|
      t.string :name
      t.text :description
      t.datetime :courseDate
      t.integer :maximumAssistants
      t.integer :assistantsNumber, :default=>0
      t.integer :price

      t.timestamps
    end
  end

  def self.down
    drop_table :courses
  end
end
