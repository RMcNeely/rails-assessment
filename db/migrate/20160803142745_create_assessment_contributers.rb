class CreateAssessmentContributers < ActiveRecord::Migration
  def change
    create_table :assessment_contributers do |t|

      t.timestamps null: false
    end
  end
end
