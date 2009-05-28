class CreateJudges < ActiveRecord::Migration
  def self.up
    create_table "judges", :force => true do |t|
      t.column :username,                  :string, :limit => 40
      t.column :name,                      :string, :limit => 100, :default => '', :null => true
      t.column :email,                     :string, :limit => 100
      t.column :crypted_password,          :string, :limit => 40
      t.column :salt,                      :string, :limit => 40
      t.column :created_at,                :datetime
      t.column :updated_at,                :datetime
      t.column :remember_token,            :string, :limit => 40
      t.column :remember_token_expires_at, :datetime
      t.boolean :admin, :default => false

    end
    add_index :judges, :username, :unique => true
  end

  def self.down
    drop_table "judges"
  end
end
