class DropEmployeesProjects < ActiveRecord::Migration[6.1]
  def change
    drop_table :employees_projects
  end
end
