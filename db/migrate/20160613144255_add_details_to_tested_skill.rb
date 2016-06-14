class AddDetailsToTestedSkill < ActiveRecord::Migration
  def change
    add_column :tested_skills, :skill_id, :integer
    add_column :tested_skills, :assessment_id, :integer
  end
end
