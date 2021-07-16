class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      
      t.string :name
      t.integer :price
      t.boolean :status, default: true, null: false
      t.text :introduction
      t.integer :genre_id
      t.string :item_image

      t.timestamps
    end
  end
end
