class StudentsController < ApplicationController
  before_action :set_classroom
  before_action :set_student, only: [:show, :update, :destroy]

  def index
    @students = policy_scope(Student)
  end

  def show
  end

  def create
    @student = @classroom.students.build(student_params)
    authorize @student
    if @student.save
      render :show
    else
      render_error
    end
  end

  def update
    if @student.update(student_params)
      render :show
    else
      render_error
    end
  end

  def destroy
    if @student.destroy
      render :index
    else
      render_error
    end
  end

  private

  def set_classroom
    @classroom = Classroom.find(params[:classroom_id])
    authorize @classroom, :user_is_owner?
  end

  def set_student
    @student = Student.find(params[:id])
    authorize @student
  end

  def student_params
    params.require(:student).permit(:last_name, :first_name)
  end

  def render_error
    render json: { errors: @restaurant.errors.full_messages }, status: :unprocessable_entity
  end
end
