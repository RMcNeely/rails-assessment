class StudentsController < ApplicationController

  load_and_authorize_resource

  def index
    binding.pry
    @students = Student.all
  end

  def show
    @student = Student.find_by(id: params[:id])
  end


  def edit
    @student = Student.find_by(id: params[:id])
  end

  def update
    @student = Student.find_by(id: params[:id])

    if !student_params[:before_add_for_skills].empty?
      skill = Skill.find_or_create_by(name: student_params[:before_add_for_skills], user_id: @student.id)
    end
    if !student_params[:mastered_skills].empty?
      @student.change_skill_to_mastered(student_params)
    end
    @student.update(bio: student_params[:bio], status: student_params[:status])
    redirect_to student_path
  end

  def student_params
    params.require(:student).permit(:bio, :status, :before_add_for_skills, :mastered_skills => [])
  end

  def current_ability
    @current_ability ||= Ability.new(current_user, session)
end


end
