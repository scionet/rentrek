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
end
