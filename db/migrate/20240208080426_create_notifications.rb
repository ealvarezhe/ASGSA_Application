class CreateNotifications < ActiveRecord::Migration[7.1]
  def change
    create_table :notifications do |t|
      t.string :description
      t.time :send_time
      t.date :send_date
      t.boolean :is_sent

      t.timestamps
    end
  end
end
