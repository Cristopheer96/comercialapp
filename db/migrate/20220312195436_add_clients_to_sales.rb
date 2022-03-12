class AddClientsToSales < ActiveRecord::Migration[6.1]
  def change
    add_reference :sales, :client, foreign_key: true
  end
end
