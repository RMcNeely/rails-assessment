class Student < User
  has_many :assessments
  has_many :skills, through: :assessments

  def mastered_skills
    self.skills.mastered
  end

  def change_skill_to_mastered(params)
    binding.pry
    params[:mastered_skills].pop
    params[:mastered_skills].each do |x|
      skill = Skill.find_by(id: x, user_id: self.id)
      skill.mastered = true
      skill.save
    end
  end

end
