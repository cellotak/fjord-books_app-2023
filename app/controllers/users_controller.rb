# frozen_string_literal: true

class UsersController < ApplicationController
  ITEM_COUNT_PER_PAGE = 10

  def index
    @users = User.order(:id).page(params[:page]).per(ITEM_COUNT_PER_PAGE)
  end

  # GET /books/1 or /books/1.json
  def show
    @user = User.find(params[:id])
  end
end
