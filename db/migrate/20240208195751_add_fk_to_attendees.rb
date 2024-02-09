class AddFkToAttendees < ActiveRecord::Migration[7.1]
  def change
    add_column :attendees, :event_id, :bigint
    add_foreign_key :attendees, :events, column: :event_id, primary_key: :event_id
  end
end
