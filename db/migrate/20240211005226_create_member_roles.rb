class CreateMemberRoles < ActiveRecord::Migration[7.1]
  def change
    create_table :member_roles, primary_key: "member_role_id" do |t|
      t.integer :member_id
      t.integer :role_id

      t.timestamps
    end
  end
end
