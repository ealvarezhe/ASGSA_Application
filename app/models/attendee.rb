class Attendee < ApplicationRecord
  belongs_to :event
  belongs_to :member

  validate :unique_member_and_event

  private

  def unique_member_and_event
    existing_attendee = Attendee.find_by(member_id: member_id, event_id: event_id)

    if existing_attendee && existing_attendee != self
      errors.add(:base, "RSVP for this event has already been created")
    end
  end
end
