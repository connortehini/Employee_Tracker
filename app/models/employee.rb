class Employee < ApplicationRecord
  belongs_to :division
  has_many :employees_projects
  has_and_belongs_to_many :projects
  validates :name, presence: true
end
