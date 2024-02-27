class CreateMemberNotifications < ActiveRecord::Migration[7.1]
  def change
    create_table :member_notifications, primary_key: "member_notification_id" do |t|
      t.integer :member_id
      t.integer :notification_id

      t.timestamps
    end
  end
end
