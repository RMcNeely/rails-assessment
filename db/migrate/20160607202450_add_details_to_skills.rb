class AddDetailsToSkills < ActiveRecord::Migration
  def change
    add_column :skills, :name, :text
    add_column :skills, :assessment_id, :integer
  end
end
