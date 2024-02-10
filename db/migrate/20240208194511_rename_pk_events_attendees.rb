class RenamePkEventsAttendees < ActiveRecord::Migration[7.1]
  def change
    rename_column :attendees, :id, :attendee_id
    rename_column :events, :id, :event_id
  end
end
