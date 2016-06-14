class AddDetailsToSkills < ActiveRecord::Migration
  def change
    add_column :skills, :user_id, :integer
    add_column :skills, :name, :text
  end
end
