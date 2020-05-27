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
    if @activity.save!
      @activity.add_player(current_user, true)
      redirect_to activity_path(@activity)
    else
      render :new
    end
  end

  def edit
    @activity = Activity.find(params[:id])
  end

  def update
    @activity = Activity.find(params[:id])
    @activity.update(activities_params)
    redirect_to activity_path(@activity)
  end

  def destroy
    @activity = Activity.find(params[:id])
    @activity.destroy
    redirect_to activities_path
  end

  private

  def activities_params
    params.require(:activity).permit(:title, :start_time, :end_time, :player_limit, :location, :skill_level, :description, :sport_id)
  end

  def set_activity
    @activity = Activity.find(params[:id])
  end
end
