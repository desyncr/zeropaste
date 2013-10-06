class ChangeColumnNameToConformAr < ActiveRecord::Migration
  def change
    rename_column :pastes, :hash, :paste_hash
  end
end
