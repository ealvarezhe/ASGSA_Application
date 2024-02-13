class Event < ApplicationRecord
    validates_presence_of :name, :location, :start_time, :end_time, :date, :points
    has_many :attendees
end
