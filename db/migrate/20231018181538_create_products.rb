class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.references :customer
      t.integer :quantity
      t.string :product
      t.float :unit_price
      t.float :amount
      t.timestamps
    end
  end
end
