class CreateCandidates < ActiveRecord::Migration
  def self.up
    create_table :candidates do |t|
      t.string :name
      t.text :bio
      t.boolean :active

      t.timestamps
    end
  end

  def self.down
    drop_table :candidates
  end
end
