class AddDetailsToAssessments < ActiveRecord::Migration
  def change
    add_column :assessments, :name, :text
    add_column :assessments, :link, :text
    add_column :assessments, :student_id, :integer
  end
end
