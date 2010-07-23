class RemoveDuedateFromJobs < ActiveRecord::Migration
  def self.up
    remove_column :jobs, :duedate
  end

  def self.down
    add_column :jobs, :duedate, :date
  end
end
