# frozen_string_literal: true

class CreateFollowings < ActiveRecord::Migration[6.1]
  def change
    create_table :followings do |t|
      t.references :follower_user, null: false, foreign_key: { to_table: :users }
      t.references :followed_user, null: false, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
