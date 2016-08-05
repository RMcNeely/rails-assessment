class AddDetailsToComments < ActiveRecord::Migration
  def change
    add_column :comments, :assessment_id, :integer
    add_column :comments, :user_id, :integer
    add_column :comments, :text, :text
    add_column :comments, :by, :text
  end
end
