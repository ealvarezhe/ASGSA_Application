class Event < ApplicationRecord
    validates :name, presence: true
    validates :location, presence: true
    validates :start_time, presence: true
    validates :end_time, presence: true
    validates :date, presence: true
    # validates :description
    validates :capacity, numericality: {only_integer: true, greater_than_or_equal_to: 0}, allow_blank: true
    validates :points, numericality: {only_integer: true, greater_than_or_equal_to: 0}
    validate :end_time_after_start_time
    has_many :attendees

    private

    def end_time_after_start_time
        return if end_time.blank? || start_time.blank?

        if end_time <= start_time
        errors.add(:end_time, "must be after the start time")
        end
    end
end
