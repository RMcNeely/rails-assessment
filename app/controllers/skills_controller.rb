class SkillsController < ApplicationController

  def index
    @skills = Skill.all
    #save for refactor: AssessmentSkill.all.where(skill_ids: some skill)
  end


end
