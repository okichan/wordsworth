class FixColumnName < ActiveRecord::Migration[5.1]
  def change
    rename_column :profiles, :image_data, :image_data
  end
end
