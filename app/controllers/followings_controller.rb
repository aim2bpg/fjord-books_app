# frozen_string_literal: true

class FollowingsController < ApplicationController
  def create
    current_user.follow(params[:user_id])
    redirect_to request.referer
  end

  def destroy
    current_user.unfollow(params[:user_id])
    redirect_to request.referer
  end

  def followed_users
    user = User.find(params[:user_id])
    @users = user.followed_users
  end

  def follower_users
    user = User.find(params[:user_id])
    @users = user.follower_users
  end
end
