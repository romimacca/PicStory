class AdminController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_user, only: [:edit, :update] 

  def index
    @users = User.all
  end

  def edit
  end

  def update 
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to admin_index_path, notice: 'Updated user'}
      else
        format.html { redirect_to admin_index_path, alert: 'User updated failed'}
      end
    end
  end

  private
  def set_user
    @user = User.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def user_params
    params.require(:user).permit(:admin)
  end

end
