class ReturnNotNullToPaste < ActiveRecord::Migration
  def change
    change_table :pastes do |t|
      t.change :ip, :string, :limit => 50, :null => false
      t.change :paste_hash, :string, :limit => 150, :null => false
      t.change :paste, :text, :null => false
    end
  end
end
