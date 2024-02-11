class Member < ApplicationRecord
  # Validate presence of essential attributes
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
  validates :points, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :position, presence: true
  validates :date_joined, presence: true
  validates :degree, presence: true
end
