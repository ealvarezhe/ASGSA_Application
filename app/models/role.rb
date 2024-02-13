class Role < ApplicationRecord
    include PgSearch::Model
    pg_search_scope :search, against: [:role_id, :name, :permissions], using: { tsearch: { prefix: true } }
    has_many :member_roles
    has_many :members, through: :member_roles
    validates :name, presence: true, uniqueness: true
    validates :permissions, presence: true
end
