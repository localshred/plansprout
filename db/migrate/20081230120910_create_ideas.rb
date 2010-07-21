class CreateIdeas < ActiveRecord::Migration
  def self.up
    create_table :ideas do |t|
      t.integer :user_id
      t.text :title, :nil => false, :length => 100
      t.text :description, :nil => true, :length => 200

      t.timestamps
    end
  end

  def self.down
    drop_table :ideas
  end
end
