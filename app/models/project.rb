class Project < ApplicationRecord
  has_many :projects_users
  has_and_belongs_to_many :users
  validates :job, presence: true
end
