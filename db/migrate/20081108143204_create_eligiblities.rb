class CreateEligiblities < ActiveRecord::Migration
  def self.up
    create_table :eligiblities do |t|
      t.integer :round_id
      t.integer :candidate_id

      t.timestamps
    end
  end

  def self.down
    drop_table :eligiblities
  end
end
