class UsersController < ApplicationController
  def index
    @users = User.all
  end

# GET /books/1 or /books/1.json
  def show
    @user = User.find(params[:id])
  end

end
