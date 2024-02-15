class ChangeEmailInMembers < ActiveRecord::Migration[7.1]
  def change
    change_column :members, :email, :string, default: "", null: false
  end
end
