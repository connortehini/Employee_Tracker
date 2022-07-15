class EmployeesProject < ApplicationRecord
  belongs_to :employees, optional: true
  belongs_to :project, optional: true
end 