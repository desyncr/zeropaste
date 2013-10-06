class AddIndexToPastesSecret < ActiveRecord::Migration
  def change
    add_index :pastes, :secret
  end
end
