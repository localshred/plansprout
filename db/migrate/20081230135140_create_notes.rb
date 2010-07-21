class CreateNotes < ActiveRecord::Migration
  def self.up
    create_table :notes do |t|
      t.integer :idea_id, :nil => false
      t.integer :user_id, :nil => false
      t.text :title, :nil => false, :length => 100
      t.text :text, :nil => false

      t.timestamps
    end
  end

  def self.down
    drop_table :notes
  end
end
