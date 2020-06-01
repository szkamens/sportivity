class UsersController < ApplicationController
  before_action :set_user, only: %i[show edit update]

  def show
  end

  def me 
    @user = current_user
    render :show
  end

  def edit
  end

  def update
    @user.sport = []
    @user.update(user_params)
    redirect_to me_path(@user)
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:description, :skill_level, :sport_id)
  end
end
