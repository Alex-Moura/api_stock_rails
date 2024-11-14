class CreateTransations < ActiveRecord::Migration[7.2]
  def change
    create_table :transations do |t|
      t.integer :quantity
      t.string :type
      t.references :product, foreign_key: true
      t.timestamps
    end
  end
end
