class ProjectsUserPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.all
    end
  end

  def create?
    user.project_manager? || user.super_admin?
  end

  def destroy?
    user.project_manager? || user.super_admin?
  end
end
