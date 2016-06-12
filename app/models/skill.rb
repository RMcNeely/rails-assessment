class Skill < ActiveRecord::Base
  belongs_to  :user
  has_many  :assessments
  has_many  :assessments_skills
end
