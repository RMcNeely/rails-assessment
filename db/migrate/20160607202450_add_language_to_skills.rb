class AddLanguageToSkills < ActiveRecord::Migration
  def change
    add_column :skills, :language, :text
  end
end
