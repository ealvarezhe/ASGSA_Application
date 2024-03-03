class AddSeenToMemberNotifications < ActiveRecord::Migration[7.1]
  def change
    add_column :member_notifications, :seen, :boolean
  end
end
