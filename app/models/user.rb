# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :avatar

  has_many :followings, class_name: 'Following', foreign_key: 'follower_user_id', dependent: :destroy, inverse_of: :follower_user
  has_many :inverse_of_followings, class_name: 'Following', foreign_key: 'followed_user_id', dependent: :destroy, inverse_of: :followed_user

  has_many :followed_users, through: :followings, source: :followed_user
  has_many :follower_users, through: :inverse_of_followings, source: :follower_user

  def follow(user_id)
    followings.create(followed_user_id: user_id)
  end

  def unfollow(user_id)
    followings.find_by(followed_user_id: user_id).destroy
  end

  def followed_user?(user)
    followed_users.include?(user)
  end
end
