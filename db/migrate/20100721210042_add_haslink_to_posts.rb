class AddHaslinkToPosts < ActiveRecord::Migration
  def self.up
    add_column :posts, :haslink, :boolean, :default=>"0"
  end

  def self.down
    remove_column :posts, :haslink
  end
end
