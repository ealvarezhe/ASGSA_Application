class CreateRoles < ActiveRecord::Migration[7.1]
  def change
    create_table :roles, primary_key: "role_id" do |t|
      t.string :name
      t.string :permissions
      t.timestamps
    end
  end
end
