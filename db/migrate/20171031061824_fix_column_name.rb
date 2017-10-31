class FixColumnName < ActiveRecord::Migration[5.1]
  def change
    rename_column :profiles, :avatar, :image_data
  end
end
