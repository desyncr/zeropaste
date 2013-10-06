class AddSecretToPastes < ActiveRecord::Migration
  def change
    add_column :pastes, :secret, :string
  end
end
