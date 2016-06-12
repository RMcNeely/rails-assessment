class CreateAssessmentsSkills < ActiveRecord::Migration
  def change
    create_table :assessments_skills do |t|

      t.timestamps null: false
    end
  end
end
