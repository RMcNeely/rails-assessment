class AssessmentsController < ApplicationController
  load_and_authorize_resource
  skip_load_and_authorize_resource   :only => [:next, :prev]


  def index
    @current_user = current_user
    #binding.pry
    @assessments = Assessment.all
    respond_to do |format|
      format.html {render :index}
      format.json {render json: @assessments, root: true}
    end
  end

  def new
    @user = User.find_by(id: params[:user_id])
    @assessment = Assessment.new
    3.times {@assessment.skills.build}
    @skills = @assessment.skills
  end

  def create
    binding.pry
  #  params[:assessment][:skill_ids].delete_if {|x| x == ""}
    @assessment = Assessment.new(assessment_params)
    @assessment.save
    redirect_to user_path(@assessment.user.id)
  end

  def next_or_prev
    # binding.pry
    @assessment = Assessment.next_or_prev(params)
    render  json: @assessment, root: true
  end

  def show
    @assessment = Assessment.find_by_slug_or_id(params)
    respond_to do |format|
        format.html {render :show}
        format.json {render json: @assessment, root: true}
      end
  end

  def edit
    @assessment = Assessment.find_by_slug(params[:slug])
    @user = User.find_by(id: params[:user_id])
    @skills = []
    3.times {@skills << @assessment.skills.build}
  end

  def update
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
