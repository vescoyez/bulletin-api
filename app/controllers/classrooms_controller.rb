class ClassroomsController < ApplicationController

  def index
    @classrooms = Classroom.where(user: current_user)
  end

  def show
    @classroom = Classroom.find(params[:id])
  end

  def new
    @classroom = Classroom.new(user: current_user)
  end

  def create
    @classroom = Classroom.create(classroom_params)

    redirect_to classroom_path(@classroom)
  end

  def edit
    @classroom = Classroom.find(params[:id])
  end

  def update
    @classroom = Classroom.find(params[:id])
    @classroom.update(classroom_params)

    redirect_to classroom_path(@classroom)
  end

  def destroy
    @classroom = Classroom.find(params[:id])
    @classroom.destroy

    redirect_to classrooms_path
  end

  private

  def classroom_params
    params.require(:classroom).permit(:name, :user_id)
  end
end
