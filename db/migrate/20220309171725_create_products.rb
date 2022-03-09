class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.string :nombre
      t.string :descripcion
      t.integer :existencia
      t.decimal :precio
      t.references :categories, null: false, foreign_key: true
      t.references :suppliers, null: false, foreign_key: true
      t.string :imagen

      t.timestamps
    end
  end
end
