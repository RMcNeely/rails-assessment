class AddStrengthToAssessmentSkill < ActiveRecord::Migration
  def change
    add_column :assessment_skills, :strength, :integer
  end
end
