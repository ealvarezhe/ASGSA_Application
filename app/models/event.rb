class Event < ApplicationRecord
    attr_accessor :start_am_pm
    attr_accessor :end_am_pm
    has_many :attendees
end
