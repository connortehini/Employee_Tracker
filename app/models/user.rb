class User < ApplicationRecord
  # scope :employee, -> { where(role: 'employee') }
  # scope :hr_manager, -> { where(role:'hr_manager') }

  enum role: {
    employee: 0,
    hr_manager: 1,
    project_manager: 2,
    super_admin: 3
  }


  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  
end
