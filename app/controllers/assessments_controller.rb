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

  end

  def show
    @assessment = Assessment.find_by_slug(params)
  end

  def edit

  end
end
