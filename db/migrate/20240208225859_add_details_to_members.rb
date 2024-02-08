class AddDetailsToMembers < ActiveRecord::Migration[7.1]
  def change
    add_column :members, :date_joined, :date
    add_column :members, :degree, :string
    add_column :members, :food_allergies, :string
  end
end
