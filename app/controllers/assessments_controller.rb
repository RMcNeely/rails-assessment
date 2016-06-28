class AssessmentsController < ApplicationController
  load_and_authorize_resource

  def index
    @current_user = current_user
    #binding.pry
    @assessments = Assessment.all
  end

  def new
    @user = User.find_by(id: params[:user_id])
    @assessment = Assessment.new

  end

  def create
    binding.pry
  #  params[:assessment][:skill_ids].delete_if {|x| x == ""}
    @assessment = Assessment.new(assessment_params)
    @assessment.save
    redirect_to user_path(@assessment.user.id)
  end

  def show
    @assessment = Assessment.find_by_slug(params[:slug])
  end

  def edit
    @assessment = Assessment.find_by_slug(params[:slug])
    @user = User.find_by(id: params[:user_id])
  end

  def update
    binding.pry
    @assessment.update(assessment_params)
    redirect_to user_path(assessment_params[:user_id])
  end

  def destroy
    @assessments = Assessment.find_by_slug(params[:slug]).destroy
    redirect_to assessments_path
  end

  def assessment_params
    params.require(:assessment).permit(:name, :link, :user_id, :completed, :skill_ids =>[], skills_attributes:[:name])
  end

  def current_ability
    @current_ability ||= Ability.new(current_user, session[:user_id])
  end

end

#params[:assessment][skills_attributes:{([]=>[:name])}]
