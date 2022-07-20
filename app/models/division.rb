class Division < ApplicationRecord
  has_many :users, dependent: :destroy
  validates :title, presence: true
end
