class AssessmentsController < ApplicationController
  def index
    @current_user = current_user
    #binding.pry
    @assessments = Assessment.all
  end

  def new
    @assessment = Assessment.new
  end

  def create
    params[:assessment][:skill_ids].delete_if {|x| x == ""}
    binding.pry
    @assessment = Assessment.new(assessment_params)
    @assessment.associate_skills_to_assessment(assessment_params)
    @assessment.add_new_skills(assessment_params)
    @assessment.save
    redirect_to '/assessments'
  end

  def show
    @assessment = Assessment.find_by_slug(params[:slug])
  end

  def edit
    @assessment = Assessment.find_by_slug(params[:slug])

  end

  def assessment_params
    params.require(:assessment).permit(:name, :slug, :link, :before_add_for_skills, :add_new_tested_skills, :skill_ids =>[])
  end
end
