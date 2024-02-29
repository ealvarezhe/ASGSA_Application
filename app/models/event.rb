class Event < ApplicationRecord
    include PgSearch::Model
    pg_search_scope :search, against: [:member_id], using: { tsearch: { prefix: true } }
    validates :name, presence: true
    validates :location, presence: true
    validates :start_time, presence: true
    validates :end_time, presence: true
    validates :date, presence: true
    validates :description, presence: false
    validates :capacity, numericality: {only_integer: true, greater_than_or_equal_to: 0}, allow_blank: true
    validates :points, numericality: {only_integer: true, greater_than_or_equal_to: 0}

    has_many :attendees

    validate :end_time_after_start_time

    private

    def end_time_after_start_time
        return unless start_time && end_time

        errors.add(:end_time, "must be after the start time") if end_time < start_time
    end
end
