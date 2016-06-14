class Assessment < ActiveRecord::Base
  belongs_to :skill
  belongs_to :user
  has_many :tested_skills

  include Slugifiable::InstanceMethods
  extend Slugifiable::ClassMethods

  def created_by
    self.skill.user.name
  end

  def add_new_tested_skills
  end

  def add_new_skills(params)
    binding.pry
    new_skill = params[:assessment][:add_new_tested_skills]
      TestedSkill.create(skill_id: Skill.find_or_create_by(name: new_skill).id, assessment_id: self.id)
  end

  def associate_skills_to_assessment(params)
    binding.pry
    params[:assessment][:tested_skills].each do |x|
      TestedSkill.create(skill_id: x, assessment_id: self.id)
    end
  end

end
