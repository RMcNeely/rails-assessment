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
    params[:assessment][:skill].delete_if {|x| x == ""}
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
    params.require(:assessment).permit(:name, :slug, :skill, :add_new_tested_skills)
  end
end
