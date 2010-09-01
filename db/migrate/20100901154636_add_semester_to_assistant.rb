class AddSemesterToAssistant < ActiveRecord::Migration
  def self.up
    add_column :assistants, :semester, :integer
  end

  def self.down
    remove_column :assistants, :semester
  end
end
