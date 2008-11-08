class CreateBallots < ActiveRecord::Migration
  def self.up
    create_table :ballots do |t|
      t.integer :round_id
      t.integer :judge_id

      t.timestamps
    end
  end

  def self.down
    drop_table :ballots
  end
end
