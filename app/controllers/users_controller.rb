class UsersController < ApplicationController
  def new
  end

  def show
    # @user = User.find_by(:id => params[:id])
    # New Syntax for that
    @user = User.find(params[:id])
  end
end
