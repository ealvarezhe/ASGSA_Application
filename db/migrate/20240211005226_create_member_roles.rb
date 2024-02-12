class CreateMemberRoles < ActiveRecord::Migration[7.1]
  def change
    create_table :member_roles do |t|
      t.integer :member_id
      t.integer :role_id

      t.timestamps
    end
    rename_column :member_roles, :id, :member_role_id
  end
end
