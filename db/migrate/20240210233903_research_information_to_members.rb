class ResearchInformationToMembers < ActiveRecord::Migration[7.1]
  def change
    remove_column :members, :research_topic, :string
    add_column :members, :res_topic, :string
    add_column :members, :res_lab, :string
    add_column :members, :res_pioneer, :string
    add_column :members, :res_description, :string
    add_column :members, :area_of_study, :text
  end
end
