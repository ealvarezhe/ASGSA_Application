class ModifyMemberRoles < ActiveRecord::Migration[7.1]
  def change
    # Remove the old primary key
    execute "ALTER TABLE member_roles DROP CONSTRAINT member_roles_pkey;"

    # Add the new primary key
    execute "ALTER TABLE member_roles ADD PRIMARY KEY (member_role_id);"

    # Add the foreign keys
    add_foreign_key :member_roles, :members, column: :member_id
    add_foreign_key :member_roles, :roles, column: :role_id
  end
end
