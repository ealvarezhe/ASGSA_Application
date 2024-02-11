class CreateRoles < ActiveRecord::Migration[7.1]
  def change
    create_table :roles do |t|
      t.integer :role_id
      t.string :name
      t.string :permissions

      t.timestamps
    end
  end
end
