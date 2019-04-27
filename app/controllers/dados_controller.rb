class DadosController < ApplicationController
  before_action :set_dado, only: [:show, :update, :destroy]

  # GET /dados
  def index
    @dados = Dado.all

    render json: @dados
  end

  # GET /dados/1
  def show
    render json: @dado
  end

  def data
   @dado = Dado.where("created_at >= ? and created_at <= ?", DateTime.parse(params[:inicio]), DateTime.parse(params[:fim]+" 23:59:59"))
    render json: @dado
  end

  # POST /dados
  def create
    @dado = Dado.new(dado_params)

    if @dado.save
      render json: @dado, status: :created, location: @dado
    else
      render json: @dado.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /dados/1
  def update
    if @dado.update(dado_params)
      render json: @dado
    else
      render json: @dado.errors, status: :unprocessable_entity
    end
  end

  # DELETE /dados/1
  def destroy
    @dado.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dado
      @dado = Dado.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def dado_params
      params.require(:dado).permit(:temperatura, :umidade)
    end
end
