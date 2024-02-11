class AddResearchTopicToMembers < ActiveRecord::Migration[7.1]
  def change
    add_column :members, :research_topic, :string
  end
end
