class CreateSuppliers < ActiveRecord::Migration[6.1]
  def change
    create_table :suppliers do |t|
      t.string :nombre
      t.string :direccion
      t.string :telefono

      t.timestamps
    end
  end
end
