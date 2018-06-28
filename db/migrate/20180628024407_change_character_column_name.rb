class ChangeCharacterColumnName < ActiveRecord::Migration[5.2]
  def change
    rename_column :characters, :name, :title
  end
end
