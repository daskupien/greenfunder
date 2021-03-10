class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @investments = Investment.where(user: current_user)
    @projects = Project.where(user: current_user)
  end
end
