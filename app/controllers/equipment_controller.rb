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
    @equipment = Equipment.create(equipment_params)
    @equipment.user = current_user
    authorize @equipment
    if @equipment.save
      redirect_to equipment_path(@equipment)
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
    @equipment.destroy
  end

  private

  def set_equipment
    @equipment = Equipment.find(params[:id])
  end

  def equipment_params
    params.require(:equipment).permit(:name, :description, :category_id)
  end
end
