class EquipmentController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]
  before_action :set_equipment, only: %i[show edit update destroy]

  def index
    @equipment = policy_scope(Equipment).order(created_at: :desc)
  end

  def show
    authorize @equipment
  end

  def new
    @equipment = Equipment.new
    authorize @equipment
  end

  def create
    @equipment = Equipment.new(equipment_params)
    authorize @equipment
    @equipment.user = current_user
    if @equipment.save
      redirect_to equipment_path(@equipment)
    else
      render :new
    end
  end

  def edit
    authorize @equipment
  end

  def update
    authorize @equipment
    @equipment.update(equipment_params)
    if @equipment.save
      redirect_to equipment_path(@equipment)
    else
      render :new
    end
  end

  def destroy
    authorize @equipment
    @equipment.destroy
  end

  private

  def set_equipment
    @equipment = Equipment.find(params[:id])
  end

  def equipment_params
    params.require(:equipment).permit(:name, :description, :category_id, :price_per_day, :photo)
  end
end
