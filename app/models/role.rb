class Role < ApplicationRecord
    include PgSearch::Model
    pg_search_scope :search, against: [:role_id, :name, :permissions], using: { tsearch: { prefix: true } }
end
