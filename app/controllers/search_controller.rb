class SearchController < ApplicationController
  def results
    @productos = Product.buscador(params[:termino])
    @clientes = Client.buscador(params[:termino])
    @proveedor = Supplier.buscador(params[:termino])
    @categorias = Category.buscador(params[:termino])
  end
end
