class AssessmentSkill < ActiveRecord::Base

  belongs_to  :skill
  belongs_to  :assessment

  def self.unique_skills
    pants = AssessmentSkill.all.map {|x| x.skill.name}.uniq
  end

  def skill_name
    self.skill.name || ""
  end
end
