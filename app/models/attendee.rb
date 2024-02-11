class Attendee < ApplicationRecord
  belongs_to :event
  belongs_to :member

  validate :unique_member_and_event

  private

  def unique_member_and_event

    if Attendee.exists?(member_id: member_id, event_id: event_id)
      errors.add(:base, "RSVP for this event has already been created")
    end
  end
end
