class RemoveRoleFromMembers < ActiveRecord::Migration[7.1]
  def change
    remove_column :members, :role, :string
  end
end
