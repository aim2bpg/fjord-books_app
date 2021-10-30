# frozen_string_literal: true

class Following < ApplicationRecord
  belongs_to :follower_user, class_name: 'User'
  belongs_to :followed_user, class_name: 'User'

  validates :follower_user_id, uniqueness: { scope: [:followed_user_id] }
end
