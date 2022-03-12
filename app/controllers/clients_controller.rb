class ClientsController < ApplicationController
  before_action :set_client, only: [:edit, :update, :destroy]
  def index
    @clientes = Client.all
  end

  def new
    @cliente = Client.new
  end

  def create
    @cliente = Client.new(client_params)
    respond_to do |format|
      if @cliente.save
        format.json { head :no_content }
        format.js
      else
        format.json { render json: @cliente.errors.full_messages, status: :unprocessable_entity }
        format.js { render :new }
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @cliente.update(client_params)
        format.json {head :no_content}
        format.js
      else
        format.js { render :edit }
        format.json { render json: @cliente.error.full_messages, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @cliente.destroy
    respond_to do |format|
      format.js
      format.json { head :no_content }
    end
  end

  def buscador
    @resultados = Client.buscador(params[:termino]).map do |cliente| #es una funcion CLASE que esta definifida en client.rb (modelo)
      {
        id: cliente.id,
        nombre_cliente: cliente.nombre
      }
    end
    respond_to do |format|
      format.json { render :json => @resultados }
    end
  end

  private

  def set_client
    @cliente = Client.find(params[:id])
  end

  def client_params
    params.require(:client).permit(:nombre, :direccion, :telefono)
  end
end
