class ProductsController < ApplicationController
  before_action :set_product, only: [:edit, :update, :destroy]
  before_action :set_categories, only: [:edit, :new, :create]
  before_action :set_suppliers, only: [:edit, :new, :create]

  def index
    @productos = Product.all
  end

  def show
  end

  def new
    @product = Product.new
  end

  def edit
  end

  def create
    @product = Product.new(product_params)
    respond_to do |format|
      if @product.save
        format.json {head :no_content}
        format.js
      else
        format.json { render json: @product.errors.full_messages, status: :unprocessable_entity }
        format.js { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @product.update(product_params)
        format.json { head :no_content }
        format.js
      else
        format.json { render json: @product.errors.full_messages, status: :unprocessable_entity }
        format.js { render :edit }
        raise
      end
    end
  end

  def destroy
    @product.destroy
    respond_to do |format|
      format.json { head :no_content }
      format.js
    end
  end

  def buscador

    @resultados = Product.buscador(params[:termino]).map do |producto|
      {
        id: producto.id,
        nombre_producto: producto.nombre,
        existencia: producto.existencia
      }
      end
    respond_to do |format|
      format.json { render :json => @resultados }
    end
  end

  private

  def product_params
    params.require(:product).permit(:imagen, :nombre, :descripcion, :existencia, :precio, :category_id, :supplier_id)
  end

  def set_product
    @product = Product.find(params[:id])
  end

  def set_categories
    @categorias = Category.all
  end
  def set_suppliers
    @proveedores = Supplier.all
  end
end
