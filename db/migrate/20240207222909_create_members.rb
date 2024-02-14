class CreateMembers < ActiveRecord::Migration[7.1]
  def change
    create_table :members, primary_key: "member_id" do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.integer :points
      t.string :role
      t.string :position

      t.timestamps
    end
  end
end
