class CreateMeals < ActiveRecord::Migration
  def self.up
    create_table :meals do |t|
      t.string :name
      t.string :email
      t.string :location
      t.datetime :time
      t.string :comments
      t.boolean :havedba

      t.timestamps
    end
  end

  def self.down
    drop_table :meals
  end
end
