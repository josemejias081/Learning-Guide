class SchedulesController < ApplicationController
  before_action :set_schedule, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  
  def index
    @schedules = Schedule.all
  end

  def show
  end

  def new
    @schedule = Schedule.new
  end

  def edit
  end

  def create
    @schedule = current_user.schedules.create(schedule_params)
    if @schedule.save
      redirect_to @schedule, {notice: "Schedule was successfully created." }
    else
      render "new"
    end
  end

  def update
    if @schedule.update(schedule_params)
      redirect_to @schedule
    else
      render "edit"
    end
  end

  def destroy
    @schedule.destroy
    redirect_to my_schedules_path
  end

  private
    def set_schedule
      @schedule = Schedule.find(params[:id])
    end

    def schedule_params
      params.require(:schedule).permit(:date, :event, :note)
    end
end
