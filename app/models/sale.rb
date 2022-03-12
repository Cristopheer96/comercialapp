class Sale < ApplicationRecord
  belongs_to :client, optional: true
  has_many :sale_details, dependent: :destroy
  belongs_to :user
end
