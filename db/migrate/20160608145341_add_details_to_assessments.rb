class AddDetailsToAssessments < ActiveRecord::Migration
  def change
    add_column :assessments, :name, :text
    add_column :assessments, :link, :text
    add_column :assessments, :user_id, :integer
    add_column :assessments, :completed, :boolean, default: false
  end
end
