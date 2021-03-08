class ReservationPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    @user == @record.user || @user == @record.equipment.user
  end

  def create?
    @user != @record.equipment.user
  end

  def update?
    @user == @record.user || @user == @record.equipment.user
  end

  def destroy?
    @user == @record.user || @user == @record.equipment.user
  end

  def accept?
    @user == @record.equipment.user && @record.status == "Pending"
  end

  def reject?
    @user = @record.equipment.user && @record.status == "Pending"
  end

  def cancel?
    @user == @record.user && @record.status == "Pending" || @user = @record.equipment.user
  end
end
