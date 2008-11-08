class CreateVotes < ActiveRecord::Migration
  def self.up
    create_table :votes do |t|
      t.integer :ballot_id
      t.integer :canidate_id
      t.integer :position

      t.timestamps
    end
  end

  def self.down
    drop_table :votes
  end
end
