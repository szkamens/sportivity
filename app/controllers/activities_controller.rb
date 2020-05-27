class ActivitiesController < ApplicationController
  def index
    @activities = Activity.all
  end




  def show
    @activity = Activity.find(params[:id])
  end

  def new
    @activity = Activity.new
  end

  def create
    @activity = Activity.new(activities_params)
    @activity.user = current_user
  end

  private

  def activities_params
    params.require(:activity).permit(:title, :start_time, :end_time, :player_limit, :location, :skill_level, :description)
  end

  def set_activity
    @activity = Activity.find(params[:id])
  end


end
