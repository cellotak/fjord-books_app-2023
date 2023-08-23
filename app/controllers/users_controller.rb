class UsersController < ApplicationController
  def index
    @users = User.order(:id).page(params[:page]).per(5)
  end

# GET /books/1 or /books/1.json
  def show
    @user = User.find(params[:id])
  end

end
