class ProjectPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
  end

  def index?
    user.project_manager? || user.super_admin?
    end 
  
    def show?
    user.project_manager? || user.super_admin?
    end
  
    def create?
      user.project_manager? || user.super_admin?
    end
  
    def new?
      user.project_manager? || user.super_admin?
    end
  
    def update?
      user.project_manager? || user.super_admin?
    end
  
    def edit?
      user.project_manager? || user.super_admin?
    end
  
    def destroy?
      user.project_manager? || user.super_admin?
    end
end
