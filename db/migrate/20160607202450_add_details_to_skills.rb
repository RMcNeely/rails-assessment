class AddDetailsToSkills < ActiveRecord::Migration
  def change
    add_column :skills, :language, :text
    add_column :skills, :user_id, :integer
  end
end
