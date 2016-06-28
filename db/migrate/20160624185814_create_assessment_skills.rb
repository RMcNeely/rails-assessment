class CreateAssessmentSkills < ActiveRecord::Migration
  def change
    create_table :assessment_skills do |t|
      t.integer :assessment_id
      t.integer :skill_id
      t.timestamps null: false
    end
  end
end
