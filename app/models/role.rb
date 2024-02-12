class Role < ApplicationRecord
    include PgSearch::Model
    pg_search_scope :search, against: [:role_id, :name, :permissions], using: { tsearch: { prefix: true } }
    has_many :member_roles
    has_many :members, through: :member_roles
    validates :name, presence: true
    validates :permissions, presence: true
    validates :role_id, presence: true
    validates :role_id, numericality: { only_integer: true }
    validates :role_id, uniqueness: true
    validates :name, presence: true, inclusion: { in: %w(admin member officer), message: "%{value} is not a valid role" }
end
