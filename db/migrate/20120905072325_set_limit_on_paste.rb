class SetLimitOnPaste < ActiveRecord::Migration
  def change
    change_table :pastes do |t|
      t.change :ip, :string, :limit => 50
      t.change :paste_hash, :string, :limit => 150
    end
  end
end
