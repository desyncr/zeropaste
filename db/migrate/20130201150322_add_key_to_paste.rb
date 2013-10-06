class AddKeyToPaste < ActiveRecord::Migration
  def change
    add_column :pastes, :key, :string
  end
end
