class Division < ApplicationRecord
  validates :role, presence: true
  validates :password, presence: true, length: {minimum: 6}
end