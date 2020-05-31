class UsersController < ApplicationController
  before_action :set_user, only: %i[show]

  def show
  end

  def me 
    @user = current_user
    render :show
  end
  
  private

  def set_user
    @user = User.find(params[:id])
  end
end
