class RenameItemImageColumnToItems < ActiveRecord::Migration[5.2]
  def change
    rename_column :items, :item_image, :item_image_id
  end
end
