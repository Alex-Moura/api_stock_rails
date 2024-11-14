class CreateProducts < ActiveRecord::Migration[7.2]
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.decimal :price
      t.integer :min_quantity
      t.integer :current_quantity
      t.references :supplier, foreign_key: true
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end
