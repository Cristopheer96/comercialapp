class Product < ApplicationRecord
  belongs_to :category
  belongs_to :supplier
  has_many :warehouse_records

  def self.buscador(termino)
    Product.where("nombre LIKE ?", "%#{termino}%")
  end
end
