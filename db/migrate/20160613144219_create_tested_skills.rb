class CreateTestedSkills < ActiveRecord::Migration
  def change
    create_table :tested_skills do |t|

      t.timestamps null: false
    end
  end
end
