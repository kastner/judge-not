class AddRoundIdToVotes < ActiveRecord::Migration
  def self.up
    add_column :votes, :round_id, :integer
  end

  def self.down
    remove_column :votes, :round_id
  end
end
