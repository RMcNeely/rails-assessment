class Assessment < ActiveRecord::Base
  has_many :skills
  has_many :users, through: :skills
  belongs_to :student

  include Slugifiable::InstanceMethods
  extend Slugifiable::ClassMethods

  def created_by
    self.student.name
  end

  def add_new_tested_skills
  end

  def add_new_skills(params)
    binding.pry
    new_skill = params[:before_add_for_skills]
      Skill.create(assessment_id: self.id, user_id: self.id)
  end

  def associate_skills_to_assessment(params)
    binding.pry
    if params[:skill_ids]
      params[:skill_ids].each do |x|
        Skill.create(assessment_id: self.id, user_id: self.id)
      end
    end
  end

end
