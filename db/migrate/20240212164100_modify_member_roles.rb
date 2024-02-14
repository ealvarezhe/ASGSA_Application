class ModifyMemberRoles < ActiveRecord::Migration[7.1]
  def change
    # Add the foreign keys
    add_foreign_key :member_roles, :members, column: :member_id, primary_key: :member_id
    add_foreign_key :member_roles, :roles, column: :role_id, primary_key: :role_id
  end
end
