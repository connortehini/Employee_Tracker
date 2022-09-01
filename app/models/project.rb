class Project < ApplicationRecord
  has_many :projects_users
  has_many :users, through: :projects_users
  validates_presence_of :job, presence: true
end
