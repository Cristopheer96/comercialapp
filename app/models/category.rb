class Category < ApplicationRecord
  has_many :products
  validates :nombre,presence: { message: "Debe tener un nombre" }
  validates :descripcion, presence: true

end
