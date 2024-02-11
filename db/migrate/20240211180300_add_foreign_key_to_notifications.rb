class AddForeignKeyToNotifications < ActiveRecord::Migration[7.1]
  def change
    add_column :notifications, :event_id, :integer
    add_foreign_key :notifications, :events, primary_key: :event_id
  end
end
