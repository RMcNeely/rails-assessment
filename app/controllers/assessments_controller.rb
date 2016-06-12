class AssessmentsController < ApplicationController
  def index
    @current_user = current_user
    #binding.pry
  end

  def new
    @assessment = Assessment.new
  end

  def create

  end

  def show

  end

  def edit

  end
end
