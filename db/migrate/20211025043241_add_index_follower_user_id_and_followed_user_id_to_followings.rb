# frozen_string_literal: true

class AddIndexFollowerUserIdAndFollowedUserIdToFollowings < ActiveRecord::Migration[6.1]
  def change
    add_index :followings, %i[follower_user_id followed_user_id], unique: true
  end
end
