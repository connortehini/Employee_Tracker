class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if user.super_admin?
        scope.all
      else 
        scope.where(role: 'employee')
      end 
    end
  end

  def index?
    user.super_admin? || user.hr_manager? || user.project_manager? || user.employee?
  end 

  def show?
    user.super_admin? || user.hr_manager? || user.project_manager? || user.employee?
  end

  def create?
    user.super_admin? || user.hr_manager?
  end

  def new?
    user.super_admin? || user.hr_manager?
  end

  def update?
    user.super_admin? || user.hr_manager?
  end

  def edit?
    user.super_admin? || user.hr_manager?
  end

  def destroy?
    user.super_admin? || user.hr_manager?
  end

end
