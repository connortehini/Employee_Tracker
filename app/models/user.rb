class User < ApplicationRecord
  enum role: {
    employee: 0,
    hr_manager: 1,
    project_manager: 2,
    super_admin: 3
  }


  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  
end
