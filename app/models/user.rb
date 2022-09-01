class User < ApplicationRecord
  scope :employee, -> { where(role: 'employee') }
  scope :hr_manager, -> { where(role:'hr_manager') }
  scope :project_manager, -> { where(role: 'project_manger' ) }
  scope :super_admin, -> { where(role: 'super_admin') }

  belongs_to :division
  has_many :projects_users
  has_many :projects, through: :projects_users
  validates_presence_of :name

  enum role: {
    employee: 0,
    hr_manager: 1,
    project_manager: 2,
    super_admin: 3
  }

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
         
end
