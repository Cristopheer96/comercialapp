class CreateProfiles < ActiveRecord::Migration[6.1]
  def change
    create_table :profiles do |t|
      t.string :foto
      t.string :nombre
      t.string :apellido
      t.string :direccion
      t.string :ciudad
      t.string :estado
      t.string :zip
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
