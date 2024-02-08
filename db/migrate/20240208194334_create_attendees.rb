class CreateAttendees < ActiveRecord::Migration[7.1]
  def change
    create_table :attendees do |t|
      t.boolean :attended
      t.boolean :rsvp

      t.timestamps
    end
  end
end
