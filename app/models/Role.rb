class Role < ApplicationRecord
  # validates_presence_of :name, presence: true 
  # validates_presence_of :email, presence: true
  # validates_presence_of :password, presence: true, length: {minimum: 6}

  # scope :employee, -> { where(role: 'employee') }
  # scope :hr_manager, -> { where(role:'hr_manager') }
  # scope :project_manager, -> { where(role: 'project_manger' ) }
  # scope :super_admin, -> { where(role: 'super_admin') }
end