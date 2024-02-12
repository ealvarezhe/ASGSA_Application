class CreateNotifications < ActiveRecord::Migration[7.1]
  def change
    create_table :notifications, primary_key: "notification_id" do |t|
      t.string :description
      t.time :send_time
      t.date :send_date
      t.boolean :is_sent

      t.timestamps
    end
  end
end
