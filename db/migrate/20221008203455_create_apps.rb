class CreateApps < ActiveRecord::Migration[7.0]
  def change
    create_table :apps do |t|
      t.string :name 
      t.integer :chats_count
      t.string :token
      t.index :name
      t.timestamps
    end
  end
end
