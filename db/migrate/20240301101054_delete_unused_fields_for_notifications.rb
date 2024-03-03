class DeleteUnusedFieldsForNotifications < ActiveRecord::Migration[7.1]
  def change
    remove_column :notifications, :send_time
    remove_column :notifications, :send_date
    remove_column :notifications, :is_sent
    add_column :notifications, :title, :string
  end
end
