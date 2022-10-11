class CreateMessages < ActiveRecord::Migration[7.0]
  def change
    create_table :messages do |t|
      t.text :body 
      t.integer :number 
      t.integer :flag 
      t.references :chat
      t.index :body
      t.timestamps
    end
  end
end
