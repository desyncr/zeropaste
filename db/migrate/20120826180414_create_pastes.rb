class CreatePastes < ActiveRecord::Migration
  def change
    create_table :pastes do |t|
      t.string :ip, :null => false
      t.text :paste, :null => false
      t.string :hash, :null => false

      t.timestamps
    end
    add_index :pastes, [:ip, :hash], :unique => true
  end
end
