class UpdateMemberNotifications < ActiveRecord::Migration[7.1]
  def change
    #add foreign keys
    add_foreign_key :member_notifications, :members, column: :member_id, primary_key: :member_id
    add_foreign_key :member_notifications, :notifications, column: :notification_id, primary_key: :notification_id
  end
end
