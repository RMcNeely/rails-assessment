class AddDetailsToAssessmentsSkills < ActiveRecord::Migration
  def change
    add_column :assessments_skills, :assessment_id, :integer
    add_column :assessments_skills, :skill_id, :integer
  end
end
