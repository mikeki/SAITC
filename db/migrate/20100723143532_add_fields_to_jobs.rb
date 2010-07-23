class AddFieldsToJobs < ActiveRecord::Migration
  def self.up
    add_column :jobs, :location, :string
    add_column :jobs, :experience, :string
    add_column :jobs, :maxpay, :integer
    add_column :jobs, :minpay, :integer
  end

  def self.down
    remove_column :jobs, :minpay
    remove_column :jobs, :maxpay
    remove_column :jobs, :experience
    remove_column :jobs, :location
  end
end
