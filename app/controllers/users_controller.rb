class UsersController < ApplicationController

  def index
    render json: User.all
  end

  def create
    user = User.new(user_params)
    if user.save
      render json: user
    else
      render(
        json: user.errors.full_messages, status: :unprocessable_entity
      )
    end
  end

  def show
    begin
      render json: User.find(params[:id])
    rescue
      render text: 'OUR ERROR MESSAGE', status: 404
    end
  end


  def update
    begin
      user = User.find(params[:id])
      user.update(user_params)
      render json: user
    rescue
      render text: 'User not found', status: 404
    end

  end

  def destroy
    begin
      user = User.find(params[:id])
      user.destroy
      render text: "User deleted"
    rescue
      render text: 'User not found', status: 404
    end

  end

  private
  def user_params
    params.require(:user).permit(:username)
  end
end
