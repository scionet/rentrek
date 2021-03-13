class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def my?
    true
  end

  def show?
    true
  end

  def home?
    true
  end
end
