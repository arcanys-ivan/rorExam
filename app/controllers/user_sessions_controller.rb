class UserSessionsController < ApplicationController
	skip_before_action :require_login, except: [:destroy]
  before_action :is_login?, only: [:new]
  def new
    @user = User.new
  end

  def create
    if @user = login(params[:email], params[:password])
      redirect_to root_path, notice: 'Login successful'
    else
      flash.now[:alert] = 'Login failed'
      render action: 'new'
    end
  end

  def destroy
    logout
    redirect_to root_path, notice: 'Logged out!'
  end

  private

  def is_login?
    redirect_to root_path if current_user
  end
end