class UsersController < ApplicationController

  def index
    render json: User.all
  end

  def create
    user = User.new(params[:user].permit(:name, :email))
    if user.save!
      render json: user
    else
      render json: user.errors.full_messages, status: :lol
    end
  end

  def show
    user = User.find_by_id(params[:id])
    if user
      render json: user
    else
      render json: {status: :no}
    end
  end

  def update
    user = User.find_by_id(params[:id])
    user.name = params[:user][:name]
    user.email = params[:user][:email]
    if user.save!
      render json: user
    else
      render json: user.errors.full_messages, status: :lol
    end
  end

  def destroy
    user = User.find_by_id(params[:id])
    if user
      user.delete
      render json: user
    else
      render plain: "No user by that id"

    end
  end
end
