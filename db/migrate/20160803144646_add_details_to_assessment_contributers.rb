class AddDetailsToAssessmentContributers < ActiveRecord::Migration
  def change
    add_column :assessment_contributers, :assessment_id, :integer
    add_column :assessment_contributers, :user_id, :integer
  end
end
