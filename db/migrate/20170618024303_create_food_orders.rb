class CreateFoodOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :food_orders do |t|
      t.references :food, foreign_key: true, index: true
      t.references :order, foreign_key: true, index: true
      t.integer :quantity

      t.timestamps
    end
  end
end
