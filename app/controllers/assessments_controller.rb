class AssessmentsController < ApplicationController
  def index
    @current_user = current_user
    binding.pry
  end
end
