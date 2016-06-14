class Assessment < ActiveRecord::Base
  has_many :skills
  has_many :user, through: :skills

  include Slugifiable::InstanceMethods
  extend Slugifiable::ClassMethods

  def created_by
    Skill.find_by(id: self.skill_id).user
  end

  def add_new_tested_skills
  end

  def add_new_skills(params)
    binding.pry
    new_skill = params[:before_add_for_skills]
      Skill.create(assessment_id: self.id, assessment_id: self.id)
  end

  def associate_skills_to_assessment(params)
    binding.pry
    if params[:skill_ids]
      params[:skill_ids].each do |x|
        Skill.create(assessment_id: self.id, assessment_id: self.id)
      end
    end
  end

end
