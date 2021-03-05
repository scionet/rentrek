class EquipmentsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]
  before_action :set_equipment, only: %i[show edit update destroy]
  after_action :save_show_equipment, only: %i[create update]

  def index
    @all_equipment = Equipment.all
  end

  def show
  end

  def new
    @equipment = Equipment.new
  end

  def create
    @equipment = Equipment.new(equipment_params)
    @equipment.user = current_user
  end

  def edit
  end

  def update
  end

  def destroy
    @equipment.destroy
    redirect_to
  end

  private

  def set_equipment
    @equipment = Equipment.find(params[:id])
  end

  def equipment_params
    params.require(:equipment).permit[:name, :description, :price_per_day, :image, :category_id, :available]
  end

  def save_show_equipment
    if @equipment.save
      redirect_to equipment_path(@equipment)
    else
      render :new
    end
  end
end
