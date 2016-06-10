class AddDetailsToAssessments < ActiveRecord::Migration
  def change
    add_column :assessments, :skill_id, :integer
    add_column :assessments, :name, :text
  end
end
