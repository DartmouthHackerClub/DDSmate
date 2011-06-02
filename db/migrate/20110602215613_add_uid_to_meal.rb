class AddUidToMeal < ActiveRecord::Migration
  def self.up
    add_column :meals, :uid, :string
  end

  def self.down
    remove_column :meals, :uid
  end
end
