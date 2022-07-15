class DivisionPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def index?
  end 

  def show?
    user.employee? || user.hr_manager? || user.project_manager? || user.super_admin?
  end

  def create?
    user.hr_manager? || user.super_admin?
  end

  def new?
    user.hr_manager? || user.super_admin?
  end

  def update?
   user.hr_manager? || user.super_admin?
  end

  def edit?
    user.hr_manager? || user.super_admin?
  end

  def destroy?
    user.hr_manager? || user.super_admin?
  end
end
