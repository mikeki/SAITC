class AddPlaceToCourses < ActiveRecord::Migration
  def self.up
    add_column :courses, :place, :string
  end

  def self.down
    remove_column :courses, :place
  end
end
