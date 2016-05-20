class ClassroomsController < ApplicationController
  before_action :set_classroom, only: [:show, :edit, :update, :destroy]

  def index
    @classrooms = policy_scope(Classroom)
  end

  def show
  end

  def create
    @classroom = current_user.classrooms.build(classroom_params)
    authorize @classroom
    if @classroom.save
      render :show
    else
      render_error
    end
  end

  def update
    if @classroom.update(classroom_params)
      render :show
    else
      render_error
    end
  end

  def destroy
    if @classroom.destroy
      render :index
    else
      render_error
    end
  end

  private

  def set_classroom
    @classroom = Classroom.find(params[:id])
    authorize @classroom
  end

  def classroom_params
    params.require(:classroom).permit(:name)
  end

  def render_error
    render json: { errors: @restaurant.errors.full_messages }, status: :unprocessable_entity
  end
end
