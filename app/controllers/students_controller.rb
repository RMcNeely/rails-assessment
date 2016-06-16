class StudentsController < ApplicationController

  def index
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
    binding.pry
    skill = Skill.find_or_create_by(name: student_params[:before_add_for_skills], user_id: @student.id)
    @student.update(student_params)
    redirect_to student_path
  end

  def student_params
    params.require(:student).permit(:bio, :status, :before_add_for_skills)
  end

end
