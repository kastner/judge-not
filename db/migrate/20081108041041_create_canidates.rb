class CreateCanidates < ActiveRecord::Migration
  def self.up
    create_table :canidates do |t|
      t.string :name
      t.text :bio
      t.boolean :active

      t.timestamps
    end
  end

  def self.down
    drop_table :canidates
  end
end
