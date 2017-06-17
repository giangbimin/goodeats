class CreateFoods < ActiveRecord::Migration[5.1]
  def change
    create_table :foods do |t|
      t.string :name
      t.text :description
      t.decimal :price
      t.string :image_url
      t.string :section
      t.string :cuisine
      t.integer :views_count, default: 0

      t.timestamps
    end
  end
end
