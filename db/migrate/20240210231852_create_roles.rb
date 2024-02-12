class CreateRoles < ActiveRecord::Migration[7.1]
  def change
    create_table :roles do |t|
      t.string :name
      t.string :permissions
      t.timestamps
    end
    rename_column :roles, :id, :role_id
  end
end
