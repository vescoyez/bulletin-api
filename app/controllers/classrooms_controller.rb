class ClassroomsController < ApplicationController
  before_action :set_classroom, only: [:show, :edit, :update, :destroy]

  def index
    @classrooms = policy_scope(Classroom)
  end

  def show
  end

  def new
    @classroom = Classroom.new
    authorize @classroom
  end

  def create
    @classroom = current_user.classrooms.build(classroom_params)
    authorize @classroom
    @classroom.save

    redirect_to classroom_path(@classroom)
  end

  def edit
  end

  def update
    @classroom.update(classroom_params)

    redirect_to classroom_path(@classroom)
  end

  def destroy
    @classroom.destroy

    redirect_to classrooms_path
  end

  private

  def set_classroom
    @classroom = Classroom.find(params[:id])
    authorize @classroom
  end

  def classroom_params
    params.require(:classroom).permit(:name, :user_id)
  end
end
