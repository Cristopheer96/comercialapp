class Category < ApplicationRecord
  has_many :products
  validates :nombre,presence: { message: "Debe tener un nombre" }
  validates :descripcion, presence: true

  def self.buscador(termino)
    Category.where("nombre LIKE ?", "%#{termino}%")
  end
end
