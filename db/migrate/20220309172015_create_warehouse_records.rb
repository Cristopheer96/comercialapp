class CreateWarehouseRecords < ActiveRecord::Migration[6.1]
  def change
    create_table :warehouse_records do |t|
      t.integer :user_id
      t.integer :cantidad
      t.references :supplier, foreign_key: true
      t.references :product, foreign_key: true

      t.timestamps
    end
  end
end
