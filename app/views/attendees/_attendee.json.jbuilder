json.extract! attendee, :id, :attended, :rsvp, :created_at, :updated_at
json.url attendee_url(attendee, format: :json)
