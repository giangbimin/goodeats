class CreateRatings < ActiveRecord::Migration[5.1]
  def change
    create_table :ratings do |t|
      t.references :food, foreign_key: true
      t.integer :score, default: 0
      t.string :comment
      t.string :username

      t.timestamps
    end
  end
end
