class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.string :username
      t.string :phone
      t.string :email
      t.string :address
      t.decimal :total_money

      t.timestamps
    end
  end
end
