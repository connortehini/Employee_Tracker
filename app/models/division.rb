class Division < ApplicationRecord
  has_many :users, dependent: :destroy
  validates_presence_of :title, presence: true
end
