class TestedSkill < ActiveRecord::Base
  belongs_to :skill
  belongs_to :assessment
end
