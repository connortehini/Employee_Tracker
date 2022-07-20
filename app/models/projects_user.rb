class ProjectsUser < ApplicationRecord
  belongs_to :users, optional: true
  belongs_to :project, optional: true
end 