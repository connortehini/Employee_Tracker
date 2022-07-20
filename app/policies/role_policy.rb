class RolePolicy < ApplicationPolicy

    def index?
      user.super_admin? || user.hr_manager? || user.project_manager?
    end 
  
    def show?
      user.super_admin? || user.hr_manager?
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
