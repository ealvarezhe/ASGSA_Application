class CreateAttendees < ActiveRecord::Migration[7.1]
  def change
    create_table :attendees, primary_key: "attendee_id" do |t|
      t.boolean :attended
      t.boolean :rsvp

      t.timestamps
    end
  end
end
